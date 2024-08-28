part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class LogOutEvent extends ProfileEvent {}

class SetImageEvent extends ProfileEvent {
  final String userId;
  final File image;

  SetImageEvent({required this.userId, required this.image});
}

class UpdateUserEvent extends ProfileEvent {
  final MyUser.User user;

  UpdateUserEvent({required this.user});
}
