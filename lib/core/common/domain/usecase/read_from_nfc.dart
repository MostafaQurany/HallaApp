import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/nfc_message.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';

class ReadFromNfc implements UseCase<NfcMessage, NoParams> {
  final CommonRepositories commonRepositories;

  ReadFromNfc(this.commonRepositories);

  @override
  Future<Either<Failure, NfcMessage>> call(NoParams params) async {
    return await commonRepositories.readFromNfc();
  }
}
