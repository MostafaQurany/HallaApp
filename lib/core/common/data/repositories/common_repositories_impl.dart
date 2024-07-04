
import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/data/data%20source/nfc_data_source.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';

class CommonRepositoriesImpl implements CommonRepositories {
  final NfcDataSource nfcDataSource;

  CommonRepositoriesImpl(this.nfcDataSource);
  @override
  Future<Either<Failure, bool>> getIsNfcAvailable() async {
    try {
      final res = await nfcDataSource.getNFCIsAvailable();
      return Right(res);
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
  }
}
