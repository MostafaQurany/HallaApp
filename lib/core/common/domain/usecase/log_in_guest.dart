import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';

class LogInGuest implements UseCase<Guest, NoParams> {
  final CommonRepositories commonRepositories;

  LogInGuest(this.commonRepositories);
  @override
  Future<Either<Failure, Guest>> call(NoParams params) async {
    return await commonRepositories.logInGuest();
  }
}
