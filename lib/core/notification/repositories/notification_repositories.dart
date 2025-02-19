import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/core/notification/data/notification_database.dart';
import 'package:halla/core/notification/entites/my_notification.dart';

import '../entites/notification_type_enum.dart';

abstract class NotificationRepository {
  // FCM operations for notification
  Future<Either<Failure, void>> updateUserFCMToken(String userId);

  Future<Either<Failure, void>> deleteUserFCMToken(String userId);

  // Database operations for notification
  Future<Either<Failure, void>> saveNotification(MyNotification notification);

  Stream<List<MyNotification>> getLast10Notifications({
    required String userId,
    required MyNotificationType type,
  });

  Future<Either<Failure, List<MyNotification>>> getNext10Notifications({
    required String userId,
    required MyNotification lastNotification,
    required MyNotificationType type,
  });

  Future<Either<Failure, void>> makeNotificationSeen(
      MyNotification notification);

  Future<Either<Failure, void>> deleteNotification(MyNotification notification);
}

class NotificationRepositoriesImp implements NotificationRepository {
  NotificationDatabase notificationDatabase;

  NotificationRepositoriesImp(this.notificationDatabase);

  // FCM
  @override
  Future<Either<Failure, void>> updateUserFCMToken(String userId) async {
    try {
      await notificationDatabase.updateUserFCMToken(userId);
      return Right(null);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUserFCMToken(String userId) async {
    try {
      await notificationDatabase.deleteUserFCMToken(userId);
      return Right(null);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  // notification

  @override
  Future<Either<Failure, void>> saveNotification(
      MyNotification notification) async {
    try {
      await notificationDatabase.saveNotification(notification);
      return Right(null);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> makeNotificationSeen(
      MyNotification notification) async {
    try {
      await notificationDatabase.makeNotificationSeen(notification);
      return Right(null);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Stream<List<MyNotification>> getLast10Notifications({
    required String userId,
    required MyNotificationType type,
  }) {
    try {
      final res = notificationDatabase.getLast10Notifications(
        userId: userId,
        type: type,
      );
      return res;
    } on ServerException catch (e) {
      throw e.message;
    }
  }

  @override
  Future<Either<Failure, void>> deleteNotification(
    MyNotification notification,
  ) async {
    try {
      await notificationDatabase.deleteNotification(notification);
      return Right(null);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MyNotification>>> getNext10Notifications({
    required String userId,
    required MyNotification lastNotification,
    required MyNotificationType type,
  }) async {
    try {
      final res = await notificationDatabase.getNext10Notifications(
          userId: userId, type: type, lastNotification: lastNotification);
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
