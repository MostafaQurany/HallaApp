import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/usecase/get_is_nfc_available.dart';
import 'package:halla/core/common/presentation/cubit/user_cubit.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/auth/domain/usecases/get_sms_code_usecase.dart';
import 'package:halla/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:halla/features/auth/domain/usecases/sent_sms_code_usecase.dart';
import 'package:halla/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:halla/features/auth/domain/usecases/upload_user_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // core
  final UserCubit _userCubit;
  // core => nfc usecase
  final StreamController<bool> _nfcStatusController = StreamController<bool>();
  final GetIsNfcAvailable _getIsNfcAvailable;
  // auth usecase
  final SignInWithEmailPasswordUsecase _signInWithEmailPasswordUsecase;
  final GetSmsCodeUsecase _getSmsCodeUsecase;
  final SentSmsCodeUsecase _sentSmsCodeUsecase;
  // database usecase
  final GetUserUsecase _getUserUsecase;
  final UploadUserUsecase _uploadUserUsecase;

  AuthBloc({
    required UserCubit userCubit,
    required SignInWithEmailPasswordUsecase signInWithEmailPassword,
    required GetSmsCodeUsecase getSmsCodeUsecase,
    required SentSmsCodeUsecase sentSmsCodeUsecase,
    required GetUserUsecase getUserUsecase,
    required UploadUserUsecase uploadUserUsecase,
    required GetIsNfcAvailable getIsNfcAvailable,
  })  : _userCubit = userCubit,
        _signInWithEmailPasswordUsecase = signInWithEmailPassword,
        _getSmsCodeUsecase = getSmsCodeUsecase,
        _sentSmsCodeUsecase = sentSmsCodeUsecase,
        _getUserUsecase = getUserUsecase,
        _uploadUserUsecase = uploadUserUsecase,
        _getIsNfcAvailable = getIsNfcAvailable,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthGetSmsCodeEvent>(_onAuthGetSmsCode);
    on<AuthSentSmsCodeEvent>(_onAuthSentSmsCode);
    on<AuthUploadUserEvent>(_onAuthUploadUser);
    on<AuthUploadUserEvent>(_onAuthUploadUser);
    on<GetIsNfcAvailableEvent>(_onGetIsNfcAvailableEvent);
  }

  _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _signInWithEmailPasswordUsecase(
      SignInWithEmailPasswordParams(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  String _verificationId = '';
  _onAuthGetSmsCode(
    AuthGetSmsCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _getSmsCodeUsecase.call(
      GetSmsCodeParams(phoneNumber: event.phoneNumber),
    );

    res.fold(
      (l) => emit(AuthFailure(message: "_onAuthGetSmsCode${l.message}")),
      (r) {
        _verificationId = r;
        emit(AuthGetCodeSmsSiccessState());
      },
    );
  }

  _onAuthSentSmsCode(
    AuthSentSmsCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _sentSmsCodeUsecase.call(
      SentSmsCodeParams(
        smsCode: event.smsCode,
        verificationId: _verificationId,
      ),
    );

    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  _onAuthUploadUser(
    AuthUploadUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _uploadUserUsecase(
      UploadUserParams(
        user: event.user,
      ),
    );

    res.fold(
      (l) => emit(AuthFailure(message: l.message)),
      (r) => _emitAuthUploadSuccess(r, emit),
    );
  }

  void _emitAuthSuccess(
    User user,
    Emitter<AuthState> emit,
  ) {
    _userCubit.updateUser(user);
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
    _userCubit.updateUser(user);
    emit(
      AuthUploadSuccess(
        user: user,
      ),
    );
  }

  // nfc
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
// =========================== get if nfc is open =============================
  // Stream<bool> getNFCStatusStream() async* {
  //   while (!_nfcStatusController.isClosed) {
  //     final isAvailable = await getNFCIsOpen();
  //     _nfcStatusController.add(isAvailable);
  //     yield isAvailable;
  //     await Future.delayed(const Duration(seconds: 5)); // Check every 5 seconds
  //   }
  // }

  // void _onCheckNFCStatus(
  //   CheckNFCStatus event,
  //   Emitter<AuthState> emit,
  // ) {
  //   emit.forEach(
  //     getNFCStatusStream(),
  //     onData: (bool isAvailable) => NFCStatus(isAvailable),
  //     onError: (error, stackTrace) => AuthFailure(message: error.toString()),
  //   );
  // }

  // void closeNFCStatusStream() {
  //   _nfcStatusController.close();
  // }
}
