part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess({
    required this.user,
  });
}

final class AuthGetCodeSmsSiccessState extends AuthState {}

final class AuthUploadSuccess extends AuthState {
  final User user;

  AuthUploadSuccess({required this.user});
}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure({
    required this.message,
  });
}
