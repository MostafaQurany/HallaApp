// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class LinkPhoneWithPhoneAuthCredentialUseCase
    implements UseCase<void, LinkPhoneWithPhoneAuthCredentialUseCaseParams> {
  final AuthRepository authRepository;

  LinkPhoneWithPhoneAuthCredentialUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, void>> call(
      LinkPhoneWithPhoneAuthCredentialUseCaseParams params) async {
    return await authRepository.linkPhoneWithPhoneAuthCredential(
        phoneAuthCredential: params.phoneAuthCredential);
  }
}

class LinkPhoneWithPhoneAuthCredentialUseCaseParams {
  final firebase_auth.PhoneAuthCredential phoneAuthCredential;

  LinkPhoneWithPhoneAuthCredentialUseCaseParams({
    required this.phoneAuthCredential,
  });
}
