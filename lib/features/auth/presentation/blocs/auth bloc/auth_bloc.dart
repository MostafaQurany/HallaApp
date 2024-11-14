import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/data/data%20source/nfc_data_source.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/entities/nfc_message.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/usecase/forget_pin_code_guest.dart';
import 'package:halla/core/common/domain/usecase/get_first_time_local_contacts_usecase.dart';
import 'package:halla/core/common/domain/usecase/get_is_nfc_available.dart';
import 'package:halla/core/common/domain/usecase/get_is_nfc_open.dart';
import 'package:halla/core/common/domain/usecase/get_user_usecase.dart';
import 'package:halla/core/common/domain/usecase/is_guest_exit.dart';
import 'package:halla/core/common/domain/usecase/is_guest_update.dart';
import 'package:halla/core/common/domain/usecase/log_in_guest.dart';
import 'package:halla/core/common/domain/usecase/read_from_nfc.dart';
import 'package:halla/core/common/domain/usecase/upload_user_usecase.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/common/domain/usecase/write_on_nfc.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:halla/features/auth/domain/usecases/get_sms_code_usecase.dart';
import 'package:halla/features/auth/domain/usecases/google_login.dart';
import 'package:halla/features/auth/domain/usecases/link_with_email_pincode.dart';
import 'package:halla/features/auth/domain/usecases/log_in_with_email_password.dart';
import 'package:halla/features/auth/domain/usecases/log_in_with_phone_use_case.dart';
import 'package:halla/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // core
  final UserCubit _userCubit;

  // core => nfc usecase
  final StreamController<bool> _nfcStatusController = StreamController<bool>();
  final GetIsNfcAvailableUsecase _getIsNfcAvailable;
  final GetIsNfcOpenUsecase _getIsNfcOpen;
  final WriteOnNfcUsecase _writeOnNfcUsecase;
  final ReadFromNfc _readFromNfc;

  // auth usecase
  final SignInWithEmailPasswordUsecase _signInWithEmailPasswordUsecase;
  final GetSmsCodeUsecase _getSmsCodeUsecase;
  final LogInWithEmailPasswordUseCase _logInWithEmailPassword;
  final GoogleLoginUseCase _googleLogin;
  final LinkWithEmailPincode _linkWithEmailPincode;
  final LogInWithPhoneUseCase _logInWithPhoneUseCase;
  final ForgetPasswordUsecase _forgetPasswordUsecase;

  // core => database usecase
  final GetUserUsecase _getUserUsecase;
  final UploadUserUsecase _uploadUserUsecase;
  final GetFirstTimeLocalContactsUsecase _getFirstTimeLocalContactsUsecase;

  // core => guest
  final LogInGuest _logInGuest;
  final IsGuestUpdate _isGuestUpdate;
  final IsGuestExit _isGuestExit;
  final ForgetPinCodeGuestUseCase _forgetPinCodeGuestUseCase;

  static AuthBloc get(context) => BlocProvider.of(context);

  AuthBloc(
    // cubit
    UserCubit userCubit,
    // auth email_password
    SignInWithEmailPasswordUsecase signInWithEmailPassword,
    LogInWithEmailPasswordUseCase logInWithEmailPassword,
    ForgetPasswordUsecase forgetPassword,
    // social
    GoogleLoginUseCase googleLogin,
    LinkWithEmailPincode linkWithEmailPincode,
    // auth phone
    GetSmsCodeUsecase getSmsCodeUsecase,
    LogInWithPhoneUseCase logInWithPhoneUseCase,
    //data base
    GetUserUsecase getUserUsecase,
    UploadUserUsecase uploadUserUsecase,
    GetFirstTimeLocalContactsUsecase getFirstTimeLocalContactsUsecase,

    // nfc
    GetIsNfcAvailableUsecase getIsNfcAvailableUsecase,
    GetIsNfcOpenUsecase getIsNfcOpenUsecase,
    WriteOnNfcUsecase writeOnNfcUsecase,
    ReadFromNfc readFromNfc,
    // guest
    LogInGuest logInGuest,
    IsGuestUpdate isGuestUpdate,
    IsGuestExit isGuestExit,
    ForgetPinCodeGuestUseCase forgetPinCodeGuestUseCase,
  )   : _userCubit = userCubit,
        _signInWithEmailPasswordUsecase = signInWithEmailPassword,
        _logInWithEmailPassword = logInWithEmailPassword,
        _googleLogin = googleLogin,
        _getSmsCodeUsecase = getSmsCodeUsecase,
        _getUserUsecase = getUserUsecase,
        _uploadUserUsecase = uploadUserUsecase,
        _getFirstTimeLocalContactsUsecase = getFirstTimeLocalContactsUsecase,
        _getIsNfcAvailable = getIsNfcAvailableUsecase,
        _getIsNfcOpen = getIsNfcOpenUsecase,
        _writeOnNfcUsecase = writeOnNfcUsecase,
        _linkWithEmailPincode = linkWithEmailPincode,
        _readFromNfc = readFromNfc,
        _logInGuest = logInGuest,
        _isGuestUpdate = isGuestUpdate,
        _isGuestExit = isGuestExit,
        _logInWithPhoneUseCase = logInWithPhoneUseCase,
        _forgetPasswordUsecase = forgetPassword,
        _forgetPinCodeGuestUseCase = forgetPinCodeGuestUseCase,
        super(AuthInitial()) {
    // auth
    on<AuthLogIn>(_onAuthLogIn);
    on<AuthGoogle>(_onAuthGoogle);
    on<AuthForgetPassword>(_onAuthForgetPassword);
    // database
    on<AuthPersonalInfoEvent>(_onAuthPersonalInfoEvent);
    on<AuthGetUserDataEvent>(_onAuthGetUserDataEvent);
    // guest
    on<AuthLogInGuestEvent>(_onAuthLogInGuestEvent);
    on<AuthForgetPinCodeGuestEvent>(_onAuthForgetPinCodeGuestEvent);
  }

  antherEmutter(Emitter<AuthState> emit, AuthState state) {
    emit(state);
  }

  _onAuthLogIn(
    AuthLogIn event,
    Emitter<AuthState> emit,
  ) async {
    //loadingEmitter(emit, "Log In");
    final res = await _logInWithEmailPassword(
      LogInWithEmailPasswordPrams(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) {
        emit(AuthFailure(message: failure.message));
      },
      (user) {
        _emitAuthSuccess(user, emit);
      },
    );
  }

  bool isSignWithSocial = false;

  _onAuthGoogle(
    AuthGoogle event,
    Emitter<AuthState> emit,
  ) async {
    //loadingEmitter(emit, "Google ");
    final res = await _googleLogin(NoParams());
    isSignWithSocial = true;
    await res.fold(
      (l) {
        isSignWithSocial = false;

        emit(AuthFailure(message: l.message));
        return Future.value();
      },
      (r) async {
        bool isExit = r['isExit'];
        User user = r['user'];
        if (isExit) {
          isSignWithSocial = false;

          _userCubit.updateUser(user: user);
          emit(
            AuthGoogleState(user: user, isExit: isExit),
          );
        } else {
          isSignWithSocial = true;
          final linkRes = await _linkWithEmailPincode(
              LinkWithEmailPincodePeram(user: user));

          await linkRes.fold(
            (l) {
              isSignWithSocial = false;
              emit(AuthFailure(message: l.message));
              return Future.value();
            },
            (r) async {
              isSignWithSocial = true;
              _userCubit.updateUser(user: user);
              emit(
                AuthGoogleState(user: user, isExit: isExit),
              );
            },
          );
        }
      },
    );
  }

  final String _verificationId = '';
  bool isLogWithPhone = false;

  _onAuthPersonalInfoEvent(
    AuthPersonalInfoEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthPersonalInfoLoading());
    final res = await _uploadUserUsecase(
      UploadUserParams(
        user: event.user,
      ),
    );
    res.fold(
      (l) {
        emit(AuthFailure(message: l.message));
      },
      (r) {
        _userCubit.updateUser(user: r);
        emit(AuthPersonalInfoSuccess(user: r));
      },
    );
  }

  _onAuthGetUserDataEvent(
    AuthGetUserDataEvent event,
    Emitter<AuthState> emit,
  ) async {
    //loadingEmitter(emit, "Get User Data");
    final res = await _getUserUsecase(
      GetUserParams(
        userId: event.user.id,
      ),
    );

    res.fold(
      (l) {
        emit(AuthFailure(message: l.message));
      },
      (r) {
        _emitAuthSuccess(r, emit);
      },
    );
  }

  void _emitAuthSuccess(
    User user,
    Emitter<AuthState> emit,
  ) {
    _userCubit.updateUser(user: user);
    emit(
      AuthSuccess(
        user: user,
      ),
    );
  }

  void _emitAuthUploadSuccess(
    User user,
    Emitter<AuthState> emit,
  ) {
    _userCubit.updateUser(user: user);
    emit(
      AuthUploadSuccess(
        user: user,
      ),
    );
  }

  _onAuthForgetPassword(
    AuthForgetPassword event,
    Emitter<AuthState> emit,
  ) async {
    //loadingEmitter(emit, "Forget Password");
    final res = await _forgetPasswordUsecase(
      ForgetPasswordPrams(
        email: event.email,
      ),
    );
    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) => emit(AuthSentMessageSuccess()),
    );
  }

  // guest

  _onAuthLogInGuestEvent(
    AuthLogInGuestEvent event,
    Emitter<AuthState> emit,
  ) async {
    //loadingEmitter(emit, "LogInGuest");
    final isGuestExitRes = await _isGuestExit(NoParams());
    await isGuestExitRes.fold(
      (l) {
        emit(AuthFailure(message: l.message));
      },
      (r) async {
        if (r) {
          final isUpdateRes = await _isGuestUpdate(NoParams());
          await isUpdateRes.fold(
            (l) {
              emit(AuthFailure(message: l.message));
            },
            (r) async {
              if (r) {
                emit(GuestIsUpdateState());
              } else {
                final logInGuest = await _logInGuest(NoParams());
                logInGuest.fold(
                  (l) {
                    emit(AuthFailure(message: l.message));
                  },
                  (r) {
                    _userCubit.updateUser(
                      user: r,
                    );
                    emit(LogInGuestSucces(r));
                  },
                );
              }
            },
          );
        } else {
          final logInGuest = await _logInGuest(NoParams());
          logInGuest.fold(
            (l) {
              emit(AuthFailure(message: l.message));
            },
            (r) {
              _userCubit.updateUser(
                user: r,
              );
              emit(CreatNewGuestSucces(r));
            },
          );
        }
      },
    );
  }

  _onAuthForgetPinCodeGuestEvent(
    AuthForgetPinCodeGuestEvent event,
    Emitter<AuthState> emit,
  ) async {
    //loadingEmitter(emit, "ForgetPinCodeGuest");
    final deleteGuest = await _forgetPinCodeGuestUseCase(NoParams());
    deleteGuest.fold(
      (l) => emit(
        AuthFailure(message: l.message),
      ),
      (r) => emit(
        GuestDeletedSucces(),
      ),
    );
  }
}
