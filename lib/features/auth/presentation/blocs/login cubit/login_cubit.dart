import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:halla/features/auth/domain/usecases/get_sms_code_usecase.dart';
import 'package:halla/features/auth/domain/usecases/log_in_with_email_password.dart';
import 'package:halla/features/auth/domain/usecases/log_in_with_phone_use_case.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  // cubit
  final UserCubit _userCubit;

  // usecase
  final LogInWithEmailPasswordUseCase _logInWithEmailPassword;
  final GetSmsCodeUsecase _getSmsCodeUseCase;
  final LogInWithPhoneUseCase _logInWithPhoneUseCase;
  final ForgetPasswordUsecase _forgetPassword;

  LoginCubit(
    this._userCubit,
    this._logInWithEmailPassword,
    this._logInWithPhoneUseCase,
    this._getSmsCodeUseCase,
    this._forgetPassword,
  ) : super(const LoginState.initial());

// login Email Password

  loginEmailPassword(String email, String password) async {
    emit(LoginState.loginEmailLoading());
    final result = await _logInWithEmailPassword(
        LogInWithEmailPasswordPrams(email: email, password: password));
    result.fold(
      (l) {
        emit(LoginState.loginEmailError(l.message));
      },
      (r) {
        _userCubit.updateUser(user: r);
        emit(LoginState.loginEmailSuccess());
      },
    );
  }

// login phone number
  loginGetSmsCode({
    required String phoneNumber,
  }) async {
    emit(LoginState.loginGetOTPLoading());
    final res = await _getSmsCodeUseCase.call(
      GetSmsCodeParams(phoneNumber: phoneNumber),
    );
    res.fold(
      (l) {
        emit(LoginState.loginGetOTPError(l.message));
      },
      (r) {
        emit(LoginState.loginGetOTPSuccess(r));
      },
    );
  }

  loginGetOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    emit(LoginState.loginPhoneLoading());
    final result = await _logInWithPhoneUseCase(
      LogInWithPhoneParams(
        smsCode: smsCode,
        verificationId: verificationId,
      ),
    );
    result.fold(
      (l) {
        emit(LoginState.loginPhoneError(l.message));
      },
      (r) {
        _userCubit.updateUser(user: r);
        emit(LoginState.loginPhoneSuccess());
      },
    );
  }

// forget password
}
