import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/data/data%20source/nfc_data_source.dart';
import 'package:halla/core/common/domain/entities/nfc_message.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';

class WriteOnNfcUsecase implements UseCase<NfcUse, WriteOnNfcParam> {
  final CommonRepositories commonRepositories;

  WriteOnNfcUsecase(this.commonRepositories);
  @override
  Future<Either<Failure, NfcUse>> call(WriteOnNfcParam params) async {
    return await commonRepositories.writeOnNfc(params.nfcMessage);
  }
}

class WriteOnNfcParam {
  final NfcMessage nfcMessage;

  WriteOnNfcParam({required this.nfcMessage});
}
