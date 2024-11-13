part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;

  const factory SignInState.successEmail() = SuccessEmail;

  const factory SignInState.loadingEmail() = LoadingEmail;

  const factory SignInState.error(String error) = Error;

// phone and otp states
  const factory SignInState.successGetCodeSms() = SuccessGetCodeSms;

  const factory SignInState.loadingOtp() = LoadingOtp;

  const factory SignInState.successOtp() = SucessesOtp;

  const factory SignInState.errorOtp(String error) = ErrorOtp;

// personal information state
  const factory SignInState.personalInfoLoading() = personalInfoLoading;

  const factory SignInState.personalInfoError(String message) =
      personalInfoError;

  const factory SignInState.personalInfoSuccess() = personalInfoSuccess;

  const factory SignInState.uploadUserSuccess() = UploadUserSuccess;

  // first time contact state
  const factory SignInState.firstTimeContactLoading() = FirstTimeContactLoading;

  const factory SignInState.firstTimeContactError(String message) =
      FirstTimeContactError;

  const factory SignInState.getFirstTimeContactSuccess(List<Contact> contacts) =
      GetFirstTimeContactSuccess;

  const factory SignInState.addFirstTimeContactsSuccess() =
      AddFirstTimeContactsSuccess;
}
