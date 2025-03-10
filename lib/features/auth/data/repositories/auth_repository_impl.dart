import "package:firebase_auth_platform_interface/src/providers/phone_auth.dart";
import "package:fpdart/fpdart.dart";
import "package:halla/core/common/data/data_base_source.dart";
import "package:halla/core/common/domain/entities/user.dart";
import "package:halla/core/error/failure.dart";
import "package:halla/core/error/server_exception.dart";
import "package:halla/features/auth/data/data_sources/auth_data_source.dart";
import "package:halla/features/auth/domain/repositories/auth_repository.dart";

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authDataSource, this.dataBaseSource);

  final AuthDataSource authDataSource;
  final DataBaseSource dataBaseSource;

  @override
  Future<Either<Failure, User>> signInWithEmailPassword({
    required String email,
    required String password,
    required String pinCode,
  }) {
    return _getUser(
      () async => authDataSource.signInWithEmailPassword(
        email: email,
        password: password,
        pinCode: pinCode,
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
  Future<Either<Failure, void>> linkPhoneWithPhoneAuthCredential({
    required PhoneAuthCredential phoneAuthCredential,
  }) async {
    try {
      final res = await authDataSource.linkPhoneWithEmail(
          phoneAuthCredential: phoneAuthCredential);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, PhoneAuthCredential>> getPhoneAuthCredentials({
    required String smsCode,
    required String verificationId,
  }) async {
    try {
      final res = await authDataSource.getPhoneAuthCredential(
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
      User userModel = await authDataSource.logInWithEmailPassword(
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
      User userModel = await authDataSource.googleLogIn();
      // see if there is in data base
      final isUserExit = await dataBaseSource.isUserExit(userModel);
      print("isUserExit -==== $isUserExit");
      User res;
      // == get user
      if (isUserExit) {
        res = await dataBaseSource.getUser(userModel.id);
      }
      // == create new user
      else {
        res = await dataBaseSource.uploadUser(userModel);
      }
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
      final res = await authDataSource.linkWithEmailPassword(user: user);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> logInWithPhone(
      {required String smsCode, required String verificationId}) async {
    try {
      final res = await authDataSource.logInWithPhone(
        smsCode: smsCode,
        verificationId: verificationId,
      );
      final resUser = await dataBaseSource.getUser(res);
      return right(resUser);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword(String email) async {
    try {
      final res = await authDataSource.forgetPassword(email: email);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
