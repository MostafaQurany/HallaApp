import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:halla/features/auth/domain/usecases/log_in_with_phone_use_case.dart';
import 'package:meta/meta.dart';

import 'package:halla/core/common/data/data%20source/nfc_data_source.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/entities/nfc_message.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/usecase/get_is_nfc_available.dart';
import 'package:halla/core/common/domain/usecase/get_is_nfc_open.dart';
import 'package:halla/core/common/domain/usecase/get_user_usecase.dart';
import 'package:halla/core/common/domain/usecase/is_guest_exit.dart';
import 'package:halla/core/common/domain/usecase/is_guest_update.dart';
import 'package:halla/core/common/domain/usecase/log_in_guest.dart';
import 'package:halla/core/common/domain/usecase/read_from_nfc.dart';
import 'package:halla/core/common/domain/usecase/upload_user_usecase.dart';
import 'package:halla/core/common/domain/usecase/write_on_nfc.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/auth/domain/usecases/get_sms_code_usecase.dart';
import 'package:halla/features/auth/domain/usecases/google_login.dart';
import 'package:halla/features/auth/domain/usecases/link_with_email_pincode.dart';
import 'package:halla/features/auth/domain/usecases/log_in_with_email_password.dart';
import 'package:halla/features/auth/domain/usecases/sent_sms_code_usecase.dart';
import 'package:halla/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';

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
  final SentSmsCodeUsecase _sentSmsCodeUsecase;
  final LogInWithEmailPassword _logInWithEmailPassword;
  final GoogleLogin _googleLogin;
  final LinkWithEmailPincode _linkWithEmailPincode;
  final LogInWithPhoneUseCase _logInWithPhoneUseCase;
  final ForgetPasswordUsecase _forgetPasswordUsecase;

  // core => database usecase
  final GetUserUsecase _getUserUsecase;
  final UploadUserUsecase _uploadUserUsecase;

  // core => guest
  final LogInGuest _logInGuest;
  final IsGuestUpdate _isGuestUpdate;
  final IsGuestExit _isGuestExit;

  bool isLoading = false;
  AuthBloc(
      // cubit
      UserCubit userCubit,

      // auth email_password
      SignInWithEmailPasswordUsecase signInWithEmailPassword,
      LogInWithEmailPassword logInWithEmailPassword,
      ForgetPasswordUsecase forgetPassword,
      // social
      GoogleLogin googleLogin,
      LinkWithEmailPincode linkWithEmailPincode,

      // auth phone
      GetSmsCodeUsecase getSmsCodeUsecase,
      SentSmsCodeUsecase sentSmsCodeUsecase,
      LogInWithPhoneUseCase logInWithPhoneUseCase,
      //data base
      GetUserUsecase getUserUsecase,
      UploadUserUsecase uploadUserUsecase,
      // nfc
      GetIsNfcAvailableUsecase getIsNfcAvailableUsecase,
      GetIsNfcOpenUsecase getIsNfcOpenUsecase,
      WriteOnNfcUsecase writeOnNfcUsecase,
      ReadFromNfc readFromNfc,
      // guest
      LogInGuest logInGuest,
      IsGuestUpdate isGuestUpdate,
      IsGuestExit isGuestExit)
      : _userCubit = userCubit,
        _signInWithEmailPasswordUsecase = signInWithEmailPassword,
        _logInWithEmailPassword = logInWithEmailPassword,
        _googleLogin = googleLogin,
        _getSmsCodeUsecase = getSmsCodeUsecase,
        _sentSmsCodeUsecase = sentSmsCodeUsecase,
        _getUserUsecase = getUserUsecase,
        _uploadUserUsecase = uploadUserUsecase,
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
        super(AuthInitial()) {
    // auth
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogIn>(_onAuthLogIn);
    on<AuthGoogle>(_onAuthGoogle);
    on<AuthLogWithPhoneEvent>(_onAuthLogWithPhoneEvent);
    on<AuthGetSmsCodeEvent>(_onAuthGetSmsCode);
    on<AuthSentSmsCodeEvent>(_onAuthSentSmsCode);
    on<AuthCheckPinCode>(_onAuthCheckPinCode);
    on<AuthForgetPassword>(_onAuthForgetPassword);
    // database
    on<AuthUploadUserEvent>(_onAuthUploadUser);
    on<AuthPersonalInfoEvent>(_onAuthPersonalInfoEvent);
    // guest
    on<AuthLogInGuestEvent>(_onAuthLogInGuestEvent);
    // nfc
    on<GetIsNfcAvailableEvent>(_onGetIsNfcAvailableEvent);
    on<GetIsNfcOpenEvent>(_onGetIsNfcOpenEvent);
    on<WriteOnNfcEvent>(_onWriteOnNfcEvent);
    on<ReadFromNfcEvent>(_onAuthReadFromNfc);
  }

  loadingEmitter(Emitter<AuthState> emit) {
    if (!isLoading) {
      isLoading = !isLoading;
      emit(AuthLoading());
    }
  }

  _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    loadingEmitter(emit);
    final res = await _signInWithEmailPasswordUsecase(
      SignInWithEmailPasswordParams(
        email: event.email,
        password: event.password,
        pinCode: event.pinCode,
      ),
    );

    res.fold(
      (failure) {
        isLoading = !isLoading;
        emit(AuthFailure(message: failure.message));
      },
      (user) {
        _emitAuthSuccess(user, emit);
      },
    );
  }

  _onAuthLogIn(
    AuthLogIn event,
    Emitter<AuthState> emit,
  ) async {
    loadingEmitter(emit);

    final res = await _logInWithEmailPassword(
      LogInWithEmailPasswordPrams(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) {
        isLoading = !isLoading;
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
    loadingEmitter(emit);

    final res = await _googleLogin(NoParams());
    isSignWithSocial = true;
    await res.fold(
      (l) {
        isSignWithSocial = false;
        isLoading = !isLoading;
        emit(AuthFailure(message: l.message));
        return Future.value();
      },
      (r) async {
        bool isExit = r['isExit'];
        User user = r['user'];
        if (isExit) {
          isSignWithSocial = false;
          isLoading = !isLoading;
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
              isLoading = !isLoading;
              isSignWithSocial = false;
              emit(AuthFailure(message: l.message));
              return Future.value();
            },
            (r) async {
              isLoading = !isLoading;
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

  String _verificationId = '';
  bool isLogWithPhone = false;
  _onAuthGetSmsCode(
    AuthGetSmsCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    loadingEmitter(emit);

    final res = await _getSmsCodeUsecase.call(
      GetSmsCodeParams(phoneNumber: event.phoneNumber),
    );

    res.fold(
      (l) {
        isLoading = !isLoading;
        emit(AuthFailure(message: "_onAuthGetSmsCode${l.message}"));
        isLoading = !isLoading;
      },
      (r) {
        isLoading = !isLoading;
        _verificationId = r;
        emit(AuthGetCodeSmsSiccessState());
      },
    );
  }

  _onAuthSentSmsCode(
    AuthSentSmsCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    loadingEmitter(emit);
    final res = await _sentSmsCodeUsecase(
      SentSmsCodeParams(
        smsCode: event.smsCode,
        verificationId: _verificationId,
      ),
    );
    res.fold(
      (l) {
        isLoading = !isLoading;
        emit(AuthFailure(message: l.message));
      },
      (r) async {
        isLoading = !isLoading;
        emit(
          AuthSuccess(user: _userCubit.user!),
        );
      },
    );
  }

  _onAuthLogWithPhoneEvent(
    AuthLogWithPhoneEvent event,
    Emitter<AuthState> emit,
  ) async {
    loadingEmitter(emit);

    final res = await _logInWithPhoneUseCase(
      LogInWithPhoneParams(
        smsCode: event.smsCode,
        verificationId: _verificationId,
      ),
    );
    await res.fold(
      (l) {
        isLoading = !isLoading;
        emit(AuthFailure(message: l.message));
      },
      (r) async {
        final res = await _getUserUsecase(GetUserParams(userId: r));
        await res.fold(
          (l) {
            isLoading = !isLoading;
            emit(AuthFailure(message: l.message));
            return Future.value();
          },
          (r) {
            isLoading = !isLoading;
            _userCubit.updateUser(user: r);
            emit(
              AuthSuccess(user: r),
            );
            return Future.value();
          },
        );
      },
    );
  }

  _onAuthUploadUser(
    AuthUploadUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    loadingEmitter(emit);

    final res = await _uploadUserUsecase(
      UploadUserParams(
        user: event.user,
      ),
    );

    res.fold(
      (l) {
        isLoading = !isLoading;
        emit(AuthFailure(message: l.message));
      },
      (r) {
        isLoading = !isLoading;
        _emitAuthUploadSuccess(r, emit);
      },
    );
  }

  _onAuthPersonalInfoEvent(
    AuthPersonalInfoEvent event,
    Emitter<AuthState> emit,
  ) async {
    loadingEmitter(emit);

    final res = await _uploadUserUsecase(
      UploadUserParams(
        user: event.user,
      ),
    );

    res.fold(
      (l) {
        isLoading = !isLoading;
        emit(AuthFailure(message: l.message));
      },
      (r) {
        isLoading = !isLoading;
        _userCubit.updateUser(user: r);
        emit(AuthPersonalInfoSuccess(user: r));
      },
    );
  }

  void _emitAuthSuccess(
    User user,
    Emitter<AuthState> emit,
  ) {
    isLoading = !isLoading;
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
    isLoading = !isLoading;
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
    emit(AuthLoading());
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
// =========================== nfc =============================

  _onGetIsNfcAvailableEvent(
    GetIsNfcAvailableEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _getIsNfcAvailable(NoParams());
    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) => emit(GetIsNfcAvailableState(r)),
    );
  }

  _onGetIsNfcOpenEvent(
    GetIsNfcOpenEvent event,
    Emitter<AuthState> emit,
  ) async {
    _shouldCloseNfcStatusStream = false;
    await emit.forEach(
      _getNFCStatusStream(),
      onData: (bool isAvailable) {
        return NfcState(isAvailable);
      },
      onError: (error, stackTrace) => AuthFailure(message: error.toString()),
    );
  }

  bool _shouldCloseNfcStatusStream = false;
  Stream<bool> _getNFCStatusStream() async* {
    while (!_nfcStatusController.isClosed && !_shouldCloseNfcStatusStream) {
      final res = await _getIsNfcOpen(NoParams());
      yield res.fold(
        (l) {
          throw l;
        },
        (r) {
          _nfcStatusController.add(r);
          return r;
        },
      );
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  void closeNfcStatusStream() {
    _shouldCloseNfcStatusStream = true;
    _nfcStatusController.close();
  }

  @override
  Future<void> close() {
    closeNfcStatusStream();
    return super.close();
  }

  _onWriteOnNfcEvent(
    WriteOnNfcEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _writeOnNfcUsecase(
      WriteOnNfcParam(nfcMessage: event.nfcMessage),
    );
    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) {
        _nfcStatusController.close();
        emit(
          NfcUseState(
            nfcUseState: r,
            nfcId: event.nfcMessage.id,
          ),
        );
      },
    );
  }

  _onAuthReadFromNfc(
    ReadFromNfcEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _readFromNfc(NoParams());
    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) => emit(
        NfcReadNfc(nfcMessage: r),
      ),
    );
  }

  _onAuthCheckPinCode(
    AuthCheckPinCode event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    if (event.pinCode == event.userPinCode) {
      final res = await _getUserUsecase(GetUserParams(userId: event.userId));
      res.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) {
          _userCubit.updateUser(user: r);
          emit(
            AuthGetUserSuccess(user: r),
          );
        },
      );
    } else {
      emit(AuthFailure(message: "The pin-code inccorect"));
    }
  }

  // guest

  _onAuthLogInGuestEvent(
    AuthLogInGuestEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
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
}
