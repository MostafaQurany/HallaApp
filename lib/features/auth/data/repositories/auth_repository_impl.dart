import "package:fpdart/src/either.dart";
import "package:halla/core/domain/entities/user.dart";
import "package:halla/core/error/failure.dart";
import "package:halla/core/error/server_exception.dart";
import "package:halla/features/auth/data/data_sources/auth_data_source.dart";
import "package:halla/features/auth/domain/repositories/auth_repository.dart";

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authDataSource);
  final AuthDataSource authDataSource;

  @override
  Future<Either<Failure, User>> signInWithEmailPassword(
      {required String email, required String password}) {
    return _getUser(
      () async => authDataSource.signInWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    try {
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
