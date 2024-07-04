import "package:fpdart/fpdart.dart";
import "package:halla/core/common/domain/entities/user.dart";
import "package:halla/core/error/failure.dart";
import "package:halla/core/error/server_exception.dart";
import "package:halla/features/auth/data/data_sources/auth_data_source.dart";
import "package:halla/features/auth/data/data_sources/data_base_source.dart";
import "package:halla/features/auth/data/models/user_model.dart";
import "package:halla/features/auth/domain/repositories/auth_repository.dart";

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authDataSource, this.dataBaseSource);
  final AuthDataSource authDataSource;
  final DataBaseSource dataBaseSource;

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

  @override
  Future<Either<Failure, String>> getSmsCode({
    required String phoneNumber,
  }) async {
    try {
      final res =
          await authDataSource.signInWithPhone(phoneNumber: phoneNumber);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> sentSmsCode({
    required String smsCode,
    required String verificationId,
  }) async {
    try {
      final res = await authDataSource.linkPhoneWithEmail(
        smsCode: smsCode,
        verificationId: verificationId,
      );
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> uploadUser({required User user}) async {
    try {
      UserModel userModel = UserModel.fromUser(user);
      final res = await dataBaseSource.uploadUser(userModel);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
  
  @override
  Future<Either<Failure, User>> getUser({required User user}) async{
    try {
      UserModel userModel = UserModel.fromUser(user);
      final res = await dataBaseSource.getUser(userModel);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
