import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class SignInWithEmailPasswordUsecase
    implements UseCase<User, SignInWithEmailPasswordParams> {
  final AuthRepository authRepository;
  SignInWithEmailPasswordUsecase(this.authRepository);
  @override
  Future<Either<Failure, User>> call(
      SignInWithEmailPasswordParams params) async {
    return await authRepository.signInWithEmailPassword(
        email: params.email,
        password: params.password,
        pinCode: params.pinCode);
  }
}

class SignInWithEmailPasswordParams {
  final String email;
  final String password;
  final String pinCode;

  SignInWithEmailPasswordParams({
    required this.email,
    required this.password,
    required this.pinCode,
  });
}
