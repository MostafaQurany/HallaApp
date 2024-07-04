import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/auth/domain/repositories/auth_repository.dart';

class GetUserUsecase implements UseCase<User, GetUserParams> {
  final AuthRepository authRepository;
  GetUserUsecase(this.authRepository);
  @override
  Future<Either<Failure, User>> call(GetUserParams params) async {
    return await authRepository.uploadUser(user: params.user);
  }
}

class GetUserParams {
  final User user;

  GetUserParams({required this.user});
}
