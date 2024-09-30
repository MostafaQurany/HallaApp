// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';

class AddUserToLocalUsecase
    implements UseCase<void, AddUserToLocalUsecaseParams> {
  final CommonRepositories commonRepositories;

  AddUserToLocalUsecase(this.commonRepositories);
  @override
  Future<Either<Failure, void>> call(AddUserToLocalUsecaseParams params) async {
    return await commonRepositories.addUserToLocal(params.user);
  }
}

class AddUserToLocalUsecaseParams {
  User user;
  AddUserToLocalUsecaseParams({
    required this.user,
  });
}
