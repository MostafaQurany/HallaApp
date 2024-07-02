import 'package:fpdart/fpdart.dart';
import 'package:halla/core/domain/entities/user.dart';
import 'package:halla/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signInWithEmailPassword({
    required String email,
    required String password,
  });
  
}
