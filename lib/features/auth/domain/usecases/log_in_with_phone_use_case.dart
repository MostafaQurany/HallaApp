// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class LogInWithPhoneUseCase implements UseCase<User, LogInWithPhoneParams> {
  final AuthRepository authRepository;

  LogInWithPhoneUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, User>> call(LogInWithPhoneParams params) async {
    return await authRepository.logInWithPhone(
      smsCode: params.smsCode,
      verificationId: params.verificationId,
    );
  }
}

class LogInWithPhoneParams {
  final String smsCode;
  final String verificationId;

  LogInWithPhoneParams({
    required this.smsCode,
    required this.verificationId,
  });
}
