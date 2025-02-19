part of 'notification_cubit.dart';

@freezed
class NotificationState<T> with _$NotificationState<T> {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.success(T data) = _Success;
  const factory NotificationState.loaded({
    required List<MyNotification> notifications,
    required bool hasMore,
  }) = _Loaded;
  const factory NotificationState.error(String message) = _Error;
}
