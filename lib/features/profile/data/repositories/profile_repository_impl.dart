import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/profile/data/datasources/profile_data_source.dart';
import 'package:halla/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource profileDataSource;
  ProfileRepositoryImpl(this.profileDataSource);

  @override
  Future<Either<Failure, String>> getImageUrl(String userId) async {
    try {
      final r = await profileDataSource.getImage(userId);
      return right(r);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> setImageUrl(
      {required String userId, required File image}) async {
    try {
      final r = await profileDataSource.setImage(userId: userId, image: image);
      return right(r);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
