part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String password;

  AuthSignUp({
    required this.email,
    required this.password,
  });
}

final class AuthGetSmsCodeEvent extends AuthEvent {
  final String phoneNumber;
  AuthGetSmsCodeEvent({
    required this.phoneNumber,
  });
}

final class AuthSentSmsCodeEvent extends AuthEvent {
  final String smsCode;

  AuthSentSmsCodeEvent({required this.smsCode});
}

final class AuthUploadUserEvent extends AuthEvent {
  final User user;

  AuthUploadUserEvent({required this.user});
}

//nfc

final class GetIsNfcAvailableEvent extends AuthEvent {}
