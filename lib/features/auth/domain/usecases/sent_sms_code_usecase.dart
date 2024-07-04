// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class SentSmsCodeUsecase implements UseCase<User, SentSmsCodeParams> {
  final AuthRepository authRepository;
  SentSmsCodeUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, User>> call(SentSmsCodeParams params) async {
    return await authRepository.sentSmsCode(
      smsCode: params.smsCode,
      verificationId: params.verificationId,
    );
  }
}

class SentSmsCodeParams {
  final String smsCode;
  final String verificationId;
  SentSmsCodeParams({
    required this.smsCode,
    required this.verificationId,
  });
}
