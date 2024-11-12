import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class GoogleLoginUseCase implements UseCase<Map<String, dynamic>, NoParams> {
  final AuthRepository authRepository;

  GoogleLoginUseCase(this.authRepository);
  @override
  Future<Either<Failure, Map<String, dynamic>>> call(NoParams params) async {
    return await authRepository.googleLogIn();
  }
}
