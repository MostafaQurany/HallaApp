import "package:fpdart/fpdart.dart";
import "package:halla/core/common/domain/entities/user.dart";
import "package:halla/core/constants/constants.dart";
import "package:halla/core/error/failure.dart";
import "package:halla/core/error/server_exception.dart";
import "package:halla/features/auth/data/data_sources/auth_data_source.dart";
import "package:halla/core/common/data/data%20source/data_base_source.dart";
import "package:halla/core/common/data/models/user_model.dart";
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
  Future<Either<Failure, User>> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      // login in
      UserModel userModel = await authDataSource.logInWithEmailPassword(
          email: email, password: password);
      // get user
      final res = await dataBaseSource.getUser(userModel.id);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> googleLogIn() async {
    try {
      // get the google email
      UserModel userModel = await authDataSource.googleLogIn();
      // see if there is in data base
      final isUserExit = await dataBaseSource.isUserExit(userModel);

      UserModel res;
      // == get user
      if (isUserExit) {
        res = await dataBaseSource.getUser(userModel.id);
        print("isUserExit = $res");
      }
      // == create new user
      else {
        userModel.pinCode = AppConstants.generatePinCode();
        res = await dataBaseSource.uploadUser(userModel);
      }
      print("google data = = ${res.toString()}");
      return right({
        "user": res,
        "isExit": isUserExit,
      });
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> linkWlinkWithEmailPassword(User user) async {
    try {
      UserModel userModel = UserModel.fromUser(user);
      final res = await authDataSource.linkWithEmailPassword(user: userModel);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
