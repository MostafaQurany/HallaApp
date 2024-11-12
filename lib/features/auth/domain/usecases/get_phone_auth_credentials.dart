// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class GetPhoneAuthCredentials
    implements
        UseCase<firebase_auth.PhoneAuthCredential,
            GetPhoneAuthCredentialsParams> {
  final AuthRepository authRepository;

  GetPhoneAuthCredentials({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, firebase_auth.PhoneAuthCredential>> call(
      GetPhoneAuthCredentialsParams params) async {
    return await authRepository.getPhoneAuthCredentials(
      smsCode: params.smsCode,
      verificationId: params.verificationId,
    );
  }
}

class GetPhoneAuthCredentialsParams {
  final String smsCode;
  final String verificationId;

  GetPhoneAuthCredentialsParams({
    required this.smsCode,
    required this.verificationId,
  });
}
