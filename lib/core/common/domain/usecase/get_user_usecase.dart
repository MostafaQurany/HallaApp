import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';

class GetUserUsecase implements UseCase<User, GetUserParams> {
  final CommonRepositories commonRepositories;
  GetUserUsecase(this.commonRepositories);
  @override
  Future<Either<Failure, User>> call(GetUserParams params) async {
    return await commonRepositories.getUser(userId: params.userId);
  }
}

class GetUserParams {
  final String userId;

  GetUserParams({required this.userId});
}
