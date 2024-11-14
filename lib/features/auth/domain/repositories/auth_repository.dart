import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signInWithEmailPassword({
    required String email,
    required String password,
    required String pinCode,
  });

  Future<Either<Failure, String>> getSmsCode({
    required String phoneNumber,
  });

  Future<Either<Failure, firebase_auth.PhoneAuthCredential>>
      getPhoneAuthCredentials({
    required String smsCode,
    required String verificationId,
  });

  Future<Either<Failure, void>> linkPhoneWithPhoneAuthCredential({
    required firebase_auth.PhoneAuthCredential phoneAuthCredential,
  });

  Future<Either<Failure, User>> logInWithPhone({
    required String smsCode,
    required String verificationId,
  });

  Future<Either<Failure, User>> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, Map<String, dynamic>>> googleLogIn();

  Future<Either<Failure, void>> linkWlinkWithEmailPassword(
    User user,
  );

  Future<Either<Failure, void>> forgetPassword(
    String email,
  );
}
