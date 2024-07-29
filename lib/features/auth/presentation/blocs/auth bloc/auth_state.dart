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

final class AuthGetUserSuccess extends AuthState {
  final User user;

  AuthGetUserSuccess({required this.user});
}

final class AuthPersonalInfoSuccess extends AuthState {
  final User user;

  AuthPersonalInfoSuccess({required this.user});
}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure({
    required this.message,
  }) {
    print("=================>>> ErrorMessage is $message");
  }
}

// social
final class AuthGoogleState extends AuthState {
  final User user;
  final bool isExit;

  AuthGoogleState({required this.user, required this.isExit});
}

// nfc
class GetIsNfcAvailableState extends AuthState {
  final bool isAvailable;
  GetIsNfcAvailableState(this.isAvailable);
}

class NfcState extends AuthState {
  final bool isOpen;
  NfcState(this.isOpen);
}

class NfcUseState extends AuthState {
  final NfcUse nfcUseState;
  final String nfcId;
  NfcUseState({required this.nfcId, required this.nfcUseState});
}

class NfcReadNfc extends AuthState {
  final NfcMessage nfcMessage;

  NfcReadNfc({required this.nfcMessage});
}

class PinCodeCheckState extends AuthState {
  final bool isRight;

  PinCodeCheckState({required this.isRight});
}

// Guest
class CreatNewGuestSucces extends AuthState {
  final Guest guest;

  CreatNewGuestSucces(this.guest);
}

class LogInGuestSucces extends AuthState {
  final Guest guest;

  LogInGuestSucces(this.guest);
}

class GuestIsUpdateState extends AuthState {}
