import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'notification_type_enum.dart';

class MyNotification {
  String title;
  String message;
  bool isOpen;
  DateTime timestamp;
  NotificationData data;

  MyNotification({
    required this.title,
    required this.message,
    required this.data,
    required this.timestamp,
    this.isOpen = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
      'data': data.toMap(),
      'isOpen': isOpen,
    };
  }

  factory MyNotification.fromMap(Map<String, dynamic> map) {
    Timestamp timestamp = map['timestamp'] as Timestamp;
    DateTime dateTime = timestamp.toDate();
    return MyNotification(
      title: map['title'] ?? "",
      message: map['message'] ?? "",
      data: NotificationData.fromMap(map['data'] ?? {}),
      isOpen: map['isOpen'] ?? false,
      timestamp: dateTime,
    );
  }
}

class NotificationData {
  MyNotificationType type;
  String notificationId;
  String receiverId;
  String senderId;
  List<String> contactsId;

  NotificationData({
    required this.notificationId,
    required this.receiverId,
    required this.senderId,
    required this.type,
    this.contactsId = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'notificationId': notificationId,
      'receiverId': receiverId,
      'senderId': senderId,
      'contactsId': contactsId,
      'type': type.name,
    };
  }

  Map<String, dynamic> toMapWithoutContactsId() {
    return {
      'notificationId': notificationId,
      'receiverId': receiverId,
      'senderId': senderId,
      'type': type.name
    };
  }

  factory NotificationData.fromMap(Map<String, dynamic> map) {
    return NotificationData(
      contactsId: List<String>.from(map['contactsId'] ?? []),
      notificationId: map['notificationId'] ?? Uuid().v1(),
      type: getMyNotificationType(map['type'] ?? "none"),
      receiverId: map['receiverId'] ?? '',
      senderId: map['senderId'] ?? '',
    );
  }
}
