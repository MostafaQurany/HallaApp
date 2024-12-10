import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/usecase/get_first_time_local_contacts_usecase.dart';
import 'package:halla/core/common/domain/usecase/upload_user_usecase.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/features/auth/domain/usecases/get_phone_auth_credentials.dart';
import 'package:halla/features/auth/domain/usecases/get_sms_code_usecase.dart';
import 'package:halla/features/auth/domain/usecases/link_phone_with_phone_auth_credential_use_case.dart';
import 'package:halla/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/usecases/add_contact_list_usecase.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  static SignInCubit get(context) => BlocProvider.of(context);

  // core
  final UserCubit _userCubit;

  // auth usecase
  final SignInWithEmailPasswordUsecase _signInWithEmailPasswordUsecase;
  final GetSmsCodeUsecase _getSmsCodeUsecase;
  final GetPhoneAuthCredentials _getPhoneAuthCredentials;
  final LinkPhoneWithPhoneAuthCredentialUseCase
      _linkPhoneWithPhoneAuthCredentialUseCase;

  // core => database usecase
  final UploadUserUsecase _uploadUserUsecase;
  final GetFirstTimeLocalContactsUsecase _getFirstTimeLocalContactsUsecase;
  final AddContactListUseCase _addContactListUseCase;

  SignInCubit(
    this._userCubit,
    this._signInWithEmailPasswordUsecase,
    this._getSmsCodeUsecase,
    this._uploadUserUsecase,
    this._getFirstTimeLocalContactsUsecase,
    this._addContactListUseCase,
    this._getPhoneAuthCredentials,
    this._linkPhoneWithPhoneAuthCredentialUseCase,
  ) : super(const SignInState.initial());

  // sign in
  String? _email;

  String? _password;

  String? _pinCode;

  String? _phoneNumber;

  authSignUp({
    required String email,
    required String password,
    required String phoneNumber,
    required String pinCode,
  }) async {
    _email = email;
    _password = password;
    _phoneNumber = phoneNumber;
    _pinCode = pinCode;
    emit(SignInState.loadingEmail());
    // get the otp first
    final res = await _getSmsCodeUsecase.call(
      GetSmsCodeParams(phoneNumber: _phoneNumber ?? ''),
    );
    res.fold(
      (l) {
        emit(SignInState.error(l.message));
      },
      (r) {
        _verificationId = r;
        emit(SignInState.successGetCodeSms());
      },
    );
  }

  // phone sign method
  String _verificationId = '';

  authGetSmsCode({
    required String phoneNumber,
  }) async {
    emit(SignInState.loadingOtp());
    final res = await _getSmsCodeUsecase.call(
      GetSmsCodeParams(phoneNumber: phoneNumber),
    );
    res.fold(
      (l) {
        emit(SignInState.errorOtp(l.message));
      },
      (r) {
        _verificationId = r;
        emit(SignInState.successGetCodeSms());
      },
    );
  }

  firebase_auth.PhoneAuthCredential? phoneAuthCredential;

  authSentSmsCode(
    String smsCode,
  ) async {
    emit(SignInState.loadingOtp());
    final res = await _getPhoneAuthCredentials(
      GetPhoneAuthCredentialsParams(
        smsCode: smsCode,
        verificationId: _verificationId,
      ),
    );
    await res.fold(
      (l) {
        emit(SignInState.errorOtp(l.message));
        return Future.value();
      },
      (r) async {
        phoneAuthCredential = r;
        print(r.toString());
        emit(SignInState.successOtp());
      },
    );
  }

  authLinkWithEmail() async {
    final res = await _signInWithEmailPasswordUsecase(
      SignInWithEmailPasswordParams(
        email: _email ?? '',
        password: _password ?? '',
        pinCode: _pinCode ?? '',
      ),
    );
    await res.fold(
      (failure) {
        emit(SignInState.errorOtp(failure.message));
        return Future.value();
      },
      (user) async {
        //  upload user
        final res = await _linkPhoneWithPhoneAuthCredentialUseCase(
          LinkPhoneWithPhoneAuthCredentialUseCaseParams(
              phoneAuthCredential: phoneAuthCredential!),
        );
    
        res.fold(
          (l) {
            emit(SignInState.errorOtp(l.message));
            return Future.value();
          },
          (r) {
            user.primePhone = _phoneNumber ?? '';
            _uploadUser(
              user,
            );
          },
        );
      },
    );
  }

  _uploadUser(
    User user,
  ) async {
    final res = await _uploadUserUsecase(
      UploadUserParams(user: user),
    );
    await res.fold(
      (l) {
        emit(SignInState.error(l.message));
        return Future.value();
      },
      (r) async {
        _userCubit.updateUser(user: r);
        emit(SignInState.uploadUserSuccess());
        return Future.value();
      },
    );
  }

  // personal information methods
  personalInfoEvent(
    User user,
  ) async {
    emit(SignInState.personalInfoLoading());
    final res = await _uploadUserUsecase(
      UploadUserParams(
        user: user,
      ),
    );
    res.fold(
      (l) {
        emit(SignInState.personalInfoError(l.message));
      },
      (r) {
        _userCubit.updateUser(user: r);
        emit(SignInState.personalInfoSuccess());
      },
    );
  }

  // first time local contacts methods
  getNativeLocalContact() async {
    emit(SignInState.firstTimeContactLoading());
    final res = await _getFirstTimeLocalContactsUsecase(NoParams());

    res.fold(
      (l) {
        emit(SignInState.firstTimeContactError(l.message));
      },
      (r) => emit(
        SignInState.getFirstTimeContactSuccess(r),
      ),
    );
  }

  addFirstTimeContactList({
    required String userId,
    required List<String> contact,
  }) async {
    emit(SignInState.firstTimeContactLoading());

    final res = await _addContactListUseCase(AddContactListPram(
      userId: userId,
      contactIdList: contact,
    ));

    res.fold(
      (l) {
        emit(SignInState.firstTimeContactError(l.message));
      },
      (r) => emit(SignInState.addFirstTimeContactsSuccess()),
    );
  }
}
