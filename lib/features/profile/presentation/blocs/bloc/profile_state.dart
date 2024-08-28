part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

final class LogOutSuccesState extends ProfileState {}

final class ProfileImageUpdateSuccessfully extends ProfileState {
  final String imageUrl;

  ProfileImageUpdateSuccessfully({required this.imageUrl});
}

final class ProfileUpdateUserSuccessfully extends ProfileState {
  final MyUser.User user;

  ProfileUpdateUserSuccessfully({required this.user});
}
final class ProfileUserUpdateSccessfully extends ProfileState {
  final MyUser.User user;

  ProfileUserUpdateSccessfully({required this.user});
}
