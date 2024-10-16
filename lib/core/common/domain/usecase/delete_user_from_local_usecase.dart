import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';

class DeleteUserFromLocalUsecase implements UseCase<void, NoParams> {
  final CommonRepositories commonRepositories;

  DeleteUserFromLocalUsecase(this.commonRepositories);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await commonRepositories.deleteUserFromLocal();
  }
}
