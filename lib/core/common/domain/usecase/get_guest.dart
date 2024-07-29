import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';

class GetGuest implements UseCase<Guest, NoParams> {
  final CommonRepositories commonRepositories;

  GetGuest(this.commonRepositories);
  @override
  Future<Either<Failure, Guest>> call(NoParams params) async {
    return await commonRepositories.getGuest();
  }
}
