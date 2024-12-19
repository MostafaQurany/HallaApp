part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

// login Email Password
  const factory LoginState.loginEmailLoading() = LoginEmailLoading;

  const factory LoginState.loginEmailError(String message) = LoginEmailError;

  const factory LoginState.loginEmailSuccess() = LoginEmailSuccess;

// login phone number
  // otp
  const factory LoginState.loginGetOTPLoading() = LoginGetOTPLoading;

  const factory LoginState.loginGetOTPError(String message) = LoginGetOTPError;

  const factory LoginState.loginGetOTPSuccess(String verificationId) =
      LoginGetOTPSuccess;

//phone
  const factory LoginState.loginPhoneLoading() = LoginPhoneLoading;

  const factory LoginState.loginPhoneError(String message) = LoginPhoneError;

  const factory LoginState.loginPhoneSuccess() = LoginPhoneSuccess;

// forget password
  const factory LoginState.forgotPasswordLoading() = ForgotPasswordLoading;

  const factory LoginState.forgotPasswordError(String message) =
      ForgotPasswordError;

  const factory LoginState.forgotPasswordSuccess() = ForgotPasswordSuccess;

  // get user
  const factory LoginState.getUserLoading() = GetUserLoading;

  const factory LoginState.getUserError(String message) = GetUserError;

  const factory LoginState.getUserSuccess() = GetUserSuccess;

  // send message forget password
  const factory LoginState.sendMessageLoading() = SendMessageLoading;

  const factory LoginState.sendMessageError(String message) = SendMessageError;

  const factory LoginState.sendMessageSuccess() = SendMessageSuccess;
}
