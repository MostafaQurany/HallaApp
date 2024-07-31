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
