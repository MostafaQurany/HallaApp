import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class GetSmsCodeUsecase implements UseCase<String, GetSmsCodeParams> {
  final AuthRepository authRepository;
  GetSmsCodeUsecase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, String>> call(GetSmsCodeParams params) async {
    return authRepository.getSmsCode(phoneNumber: params.phoneNumber);
  }
}

class GetSmsCodeParams {
  final String phoneNumber;
  GetSmsCodeParams({
    required this.phoneNumber,
  });
}
