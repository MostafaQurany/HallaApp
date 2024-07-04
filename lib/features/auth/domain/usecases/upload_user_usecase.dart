import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class UploadUserUsecase implements UseCase<User, UploadUserParams> {
  final AuthRepository authRepository;
  UploadUserUsecase(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UploadUserParams params) async {
    return await authRepository.uploadUser(user: params.user);
  }
}

class UploadUserParams {
  final User user;

  UploadUserParams({required this.user});
}
