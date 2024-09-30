import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';

class GetUserFromLocalUsecase implements UseCase<User, NoParams> {
  final CommonRepositories commonRepositories;

  GetUserFromLocalUsecase(this.commonRepositories);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await commonRepositories.getUserFromLocal();
  }
}
