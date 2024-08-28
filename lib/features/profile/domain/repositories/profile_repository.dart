import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';

abstract class ProfileRepository {
  Future<Either<Failure, String>> getImageUrl(String userId);
  Future<Either<Failure, String>> setImageUrl({
    required String userId,
    required File image,
  });
}
