import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class LogInWithEmailPasswordUseCase
    implements UseCase<User, LogInWithEmailPasswordPrams> {
  final AuthRepository authRepository;

  LogInWithEmailPasswordUseCase(this.authRepository);
  @override
  Future<Either<Failure, User>> call(LogInWithEmailPasswordPrams params) async {
    return await authRepository.logInWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class LogInWithEmailPasswordPrams {
  final String email;
  final String password;

  LogInWithEmailPasswordPrams({required this.email, required this.password});
}
