import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class ForgetPasswordUsecase implements UseCase<void, ForgetPasswordPrams> {
  final AuthRepository authRepository;

  ForgetPasswordUsecase(this.authRepository);
  @override
  Future<Either<Failure, void>> call(ForgetPasswordPrams params) async {
    return await authRepository.forgetPassword(
      params.email,
    );
  }
}

class ForgetPasswordPrams {
  final String email;

  ForgetPasswordPrams({
    required this.email,
  });
}
