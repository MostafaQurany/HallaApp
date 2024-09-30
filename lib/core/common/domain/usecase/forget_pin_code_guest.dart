import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';

class ForgetPinCodeGuestUseCase implements UseCase<void, NoParams> {
  final CommonRepositories commonRepositories;

  ForgetPinCodeGuestUseCase(this.commonRepositories);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await commonRepositories.fotgetGuestPinCode();
  }
}
