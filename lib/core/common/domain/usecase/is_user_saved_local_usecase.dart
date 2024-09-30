import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';

class IsUserSavedLocalUsecase implements UseCase<bool, NoParams> {
  final CommonRepositories commonRepositories;

  IsUserSavedLocalUsecase(this.commonRepositories);
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await commonRepositories.isUserSavedLocal();
  }
}
