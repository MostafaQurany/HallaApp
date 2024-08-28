part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

// auth
final class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String pinCode;

  AuthSignUp({
    required this.email,
    required this.password,
    required this.pinCode,
  });
}

final class AuthLogIn extends AuthEvent {
  final String email;
  final String password;

  AuthLogIn({
    required this.email,
    required this.password,
  });
}

final class AuthGoogle extends AuthEvent {}

final class AuthLinkWithEmailPinCode extends AuthEvent {
  final User user;

  AuthLinkWithEmailPinCode({required this.user});
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

final class AuthLogWithPhoneEvent extends AuthEvent {
  final String smsCode;

  AuthLogWithPhoneEvent({required this.smsCode});
}

final class AuthCheckPinCode extends AuthEvent {
  final String userId;
  final String userPinCode;
  final String pinCode;

  AuthCheckPinCode(
      {required this.userId, required this.pinCode, required this.userPinCode});
}

final class AuthForgetPassword extends AuthEvent {
  final String email;

  AuthForgetPassword({required this.email});
}

// data base
final class AuthUploadUserEvent extends AuthEvent {
  final User user;

  AuthUploadUserEvent({required this.user});
}

final class AuthPersonalInfoEvent extends AuthEvent {
  final User user;

  AuthPersonalInfoEvent({required this.user});
}

//nfc

final class GetIsNfcAvailableEvent extends AuthEvent {}

final class GetIsNfcOpenEvent extends AuthEvent {}

final class WriteOnNfcEvent extends AuthEvent {
  final NfcMessage nfcMessage;

  WriteOnNfcEvent({required this.nfcMessage});
}

final class ReadFromNfcEvent extends AuthEvent {}

// guest

final class AuthLogInGuestEvent extends AuthEvent {}
