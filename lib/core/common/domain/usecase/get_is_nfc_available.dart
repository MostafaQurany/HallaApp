import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';

class GetIsNfcAvailable implements UseCase<bool, NoParams> {
  final CommonRepositories commonRepositories;

  GetIsNfcAvailable(this.commonRepositories);
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await commonRepositories.getIsNfcAvailable();
  }
}
