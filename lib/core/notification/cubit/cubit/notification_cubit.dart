import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/notification/data/notification_messaging.dart';
import 'package:halla/core/notification/entites/my_notification.dart';
import 'package:halla/core/notification/entites/notification_type_enum.dart';
import 'package:halla/core/notification/repositories/notification_repositories.dart';

part 'notification_cubit.freezed.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationRepository notificationRepository;

  static NotificationCubit get(context) => BlocProvider.of(context);

  NotificationCubit(
    this.notificationRepository,
  ) : super(
          NotificationState.initial(),
        );

  // update the FCM
  updateUserFCMToken(String userId) async {
    final res = await notificationRepository.updateUserFCMToken(userId);
    res.fold(
      (l) => emit(
        NotificationState.error(
          l.toString(),
        ),
      ),
      (r) => emit(
        NotificationState.success(null),
      ),
    );
  }

  // save
  sendNotification(MyNotification notification) async {
    try {
      final res = await notificationRepository.saveNotification(notification);
      res.fold(
        (l) => emit(
          NotificationState.error(
            l.toString(),
          ),
        ),
        (r) {
          NotificationMessaging.sendNotification(notification)
              .then(
            (value) => emit(
              NotificationState.success(null),
            ),
          )
              .onError(
            (error, stackTrace) {
              emit(
                NotificationState.error(
                  error.toString(),
                ),
              );
            },
          ).catchError(
            (error) {
              emit(
                NotificationState.error(
                  error.toString(),
                ),
              );
            },
          );
        },
      );
    } catch (e) {
      emit(NotificationState.error(e.toString()));
    }
  }

  // make the notification seen
  markNotificationAsSeen(MyNotification notification) async {
    final res = await notificationRepository.makeNotificationSeen(notification);
    res.fold(
      (l) {
        emit(
          NotificationState.error(
            l.toString(),
          ),
        );
      },
      (r) {
        emit(
          NotificationState.success(null),
        );
      },
    );
  }

  // delete notification
  deleteNotification(MyNotification notification) async {
    final res = await notificationRepository.deleteNotification(notification);
  }

  // log out
  logOut(String userId) async {
    await notificationRepository.deleteUserFCMToken(userId);
    emit(NotificationState.initial());
  }

  List<MyNotification> _notifications = [];
  bool _hasMore = true;

  // Fetch initial notifications
  void fetchInitialNotifications(String userId) async {
    emit(const NotificationState.loading());
    try {
      final stream = notificationRepository.getLast10Notifications(
        userId: userId,
        type: MyNotificationType.contact,
      );

      stream.listen((newNotifications) {
        _notifications = newNotifications;
        emit(NotificationState.loaded(
          notifications: _notifications,
          hasMore: _hasMore,
        ));
      });
    } catch (e) {
      emit(NotificationState.error("Failed to fetch notifications: $e"));
    }
  }

  // Fetch more notifications
  void fetchMoreNotifications(String userId) async {
    if (state is _Loading || !_hasMore) return;
    emit(const NotificationState.loading());
    try {
      final lastNotification = _notifications.last;
      final res = await notificationRepository.getNext10Notifications(
        userId: userId,
        lastNotification: lastNotification,
        type: MyNotificationType.contact,
      );
      res.fold(
        (l) {},
        (newNotifications) {
          if (newNotifications.isEmpty) {
            _hasMore = false;
          } else {
            _notifications.addAll(newNotifications);
          }
          emit(NotificationState.loaded(
              notifications: _notifications, hasMore: _hasMore));
        },
      );
    } catch (e) {
      emit(NotificationState.error("Failed to fetch more notifications: $e"));
    }
  }
}
