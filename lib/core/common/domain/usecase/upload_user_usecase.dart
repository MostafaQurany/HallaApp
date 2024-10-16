import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';

class UploadUserUsecase implements UseCase<User, UploadUserParams> {
  final CommonRepositories commonRepositories;
  UploadUserUsecase(this.commonRepositories);
  @override
  Future<Either<Failure, User>> call(UploadUserParams params) async {
    return await commonRepositories.uploadUser(user: params.user);
  }
}

class UploadUserParams {
  final User user;

  UploadUserParams({required this.user});
}
