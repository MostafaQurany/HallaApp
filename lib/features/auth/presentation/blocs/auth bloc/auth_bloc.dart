import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/presentation/cubit/user_cubit.dart';
import 'package:halla/features/auth/domain/usecases/get_sms_code_usecase.dart';
import 'package:halla/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:halla/features/auth/domain/usecases/sent_sms_code_usecase.dart';
import 'package:halla/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:halla/features/auth/domain/usecases/upload_user_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserCubit _userCubit;
  final SignInWithEmailPasswordUsecase _signInWithEmailPasswordUsecase;
  final GetSmsCodeUsecase _getSmsCodeUsecase;
  final SentSmsCodeUsecase _sentSmsCodeUsecase;
  final GetUserUsecase _getUserUsecase;
  final UploadUserUsecase _uploadUserUsecase;

  AuthBloc({
    required UserCubit userCubit,
    required SignInWithEmailPasswordUsecase signInWithEmailPassword,
    required GetSmsCodeUsecase getSmsCodeUsecase,
    required SentSmsCodeUsecase sentSmsCodeUsecase,
    required GetUserUsecase getUserUsecase,
    required UploadUserUsecase uploadUserUsecase,
  })  : _userCubit = userCubit,
        _signInWithEmailPasswordUsecase = signInWithEmailPassword,
        _getSmsCodeUsecase = getSmsCodeUsecase,
        _sentSmsCodeUsecase = sentSmsCodeUsecase,
        _getUserUsecase = getUserUsecase,
        _uploadUserUsecase = uploadUserUsecase,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthGetSmsCodeEvent>(_onAuthGetSmsCode);
    on<AuthSentSmsCodeEvent>(_onAuthSentSmsCode);
    on<AuthUploadUserEvent>(_onAuthUploadUser);
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
}
