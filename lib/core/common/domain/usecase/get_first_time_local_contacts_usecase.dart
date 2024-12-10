import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/common/domain/entities/contact.dart';

class GetFirstTimeLocalContactsUsecase
    implements UseCase<List<Contact>, NoParams> {
  final CommonRepositories commonRepositories;

  GetFirstTimeLocalContactsUsecase(this.commonRepositories);
  @override
  Future<Either<Failure, List<Contact>>> call(NoParams params) async {
    return await commonRepositories.getFirstTimeLocalContacts();
  }
}
