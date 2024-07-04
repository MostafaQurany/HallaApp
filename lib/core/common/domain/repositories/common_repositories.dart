import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';

abstract interface class CommonRepositories {
  Future<Either<Failure, bool>> getIsNfcAvailable();
}
