import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/profile/domain/repositories/profile_repository.dart';

class SetImageUrlUsecase implements UseCase<String, SetImageUrlParams> {
  final ProfileRepository profileRepository;

  SetImageUrlUsecase(this.profileRepository);

  @override
  Future<Either<Failure, String>> call(SetImageUrlParams params) async {
    return await profileRepository.setImageUrl(
      userId: params.userId,
      image: params.image,
    );
  }
}

class SetImageUrlParams {
  final String userId;
  final File image;

  SetImageUrlParams({required this.userId, required this.image});
}
