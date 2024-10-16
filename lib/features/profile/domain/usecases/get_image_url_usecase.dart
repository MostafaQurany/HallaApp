import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/features/profile/domain/repositories/profile_repository.dart';

class GetImageUrlUsecase implements UseCase<String, GetImageUrlParams> {
  final ProfileRepository profileRepository;

  GetImageUrlUsecase(this.profileRepository);

  @override
  Future<Either<Failure, String>> call(GetImageUrlParams params) async {
    return await profileRepository.getImageUrl(
      params.userId,
    );
  }
}

class GetImageUrlParams {
  final String userId;

  GetImageUrlParams({required this.userId});
}
