import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/core/notification/entites/my_notification.dart';

import '../entites/notification_type_enum.dart';

abstract class NotificationDatabase {
  /*save notification , get stream notification , make it see notification  , delete notification  , send notification with contacts */

  Future<void> saveNotification(MyNotification notification);

  Stream<List<MyNotification>> getLast10Notifications({
    required String userId,
    required MyNotificationType type,
  });

  Future<List<MyNotification>> getNext10Notifications({
    required String userId,
    required MyNotificationType type,
    required MyNotification lastNotification,
  });

  Future<void> makeNotificationSeen(MyNotification notification);

  Future<void> deleteNotification(MyNotification notification);

  /// FCM
  /* update the FCM , delete  , logOut */
  Future<void> updateUserFCMToken(String userId);

  Future<void> deleteUserFCMToken(String userId);
}

class NotificationDatabaseImpl extends NotificationDatabase {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  /*save notification , get stream notification , make it see notification  , delete notification   */

  @override
  Future<void> saveNotification(MyNotification notification) async {
    try {
      await _fireStore
          .collection(AppConstants.userNotificationCollection)
          .doc(notification.data.receiverId)
          .collection(_selectNotificationsCollection(notification.data.type))
          .doc(notification.data.notificationId)
          .set(notification.toMap());
    } catch (e) {
      print(e);
      throw ServerException("saveNotification$e");
    }
  }

  @override
  Stream<List<MyNotification>> getLast10Notifications(
      {required String userId, required MyNotificationType type}) {
    return _fireStore
        .collection(AppConstants.userNotificationCollection)
        .doc(userId)
        .collection(_selectNotificationsCollection(type))
        .orderBy('timestamp', descending: true)
        .limit(10)
        .snapshots()
        .map((snapshot) {
      print(snapshot.docs.first.data());
      return snapshot.docs.map((doc) {
        return MyNotification.fromMap(doc.data());
      }).toList();
    });
  }

  @override
  Future<List<MyNotification>> getNext10Notifications(
      {required String userId,
      required MyNotificationType type,
      required MyNotification lastNotification}) async {
    final snapshot = await _fireStore
        .collection(AppConstants.userNotificationCollection)
        .doc(userId)
        .collection(_selectNotificationsCollection(type))
        .orderBy('timestamp', descending: true)
        .startAfter([lastNotification.timestamp])
        .limit(10)
        .get();

    return snapshot.docs.map((doc) {
      return MyNotification.fromMap(doc.data());
    }).toList();
  }

  @override
  Future<void> makeNotificationSeen(MyNotification notification) async {
    try {
      notification.isOpen = true;
      await _fireStore
          .collection(AppConstants.userNotificationCollection)
          .doc(notification.data.receiverId)
          .collection(_selectNotificationsCollection(notification.data.type))
          .doc(notification.data.notificationId)
          .set(notification.toMap());
    } catch (e) {
      print(e);
      throw ServerException("makeNotificationSeen$e");
    }
  }

  @override
  Future<void> deleteNotification(MyNotification notification) async {
    try {
      await _fireStore
          .collection(AppConstants.userNotificationCollection)
          .doc(notification.data.receiverId)
          .collection(_selectNotificationsCollection(notification.data.type))
          .doc(notification.data.notificationId)
          .delete();
    } catch (e) {
      print(e);
      throw ServerException("deleteNotification $e");
    }
  }

  _selectNotificationsCollection(MyNotificationType type) {
    switch (type) {
      case MyNotificationType.contact:
        return AppConstants.notificationsContact;
      case MyNotificationType.notification:
        return AppConstants.notification;
      default:
        return AppConstants.notification;
    }
  }

  /* update the FCM , delete  FCM */
  StreamSubscription<String>? _fcmTokenSubscription;

  @override
  Future<void> updateUserFCMToken(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDocSnap = await _fireStore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .get();

      Map<String, dynamic> fcmTokens = userDocSnap.data()!["fcmToken"] ?? {};
      fcmTokens[await AppConstants.getMacAddress()] =
          await FirebaseMessaging.instance.getToken() ?? '';
      userDocSnap.reference.update({
        'fcmToken': fcmTokens,
      });
      _fcmTokenSubscription = FirebaseMessaging.instance.onTokenRefresh.listen(
        (event) async {
          fcmTokens[await AppConstants.getMacAddress()] = event;
          userDocSnap.reference.update({
            'fcmToken': fcmTokens,
          });
        },
      );
    } catch (e) {
      print(e);
      throw ServerException("updateUserFCMToken$e");
    }
  }

  @override
  Future<void> deleteUserFCMToken(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDocSnap = await _fireStore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .get();

      Map<String, dynamic> userData = userDocSnap.data()!;
      userData['fcmToken'].remove(await AppConstants.getMacAddress()) ?? {};
      userDocSnap.reference.update({
        'fcmToken': userData['fcmToken'],
      });
      _fcmTokenSubscription?.cancel();
    } catch (e) {
      print(e);
      throw ServerException("deleteUserFCMToken$e");
    }
  }
}
