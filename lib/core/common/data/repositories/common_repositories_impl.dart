import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/data/data%20source/data_base_source.dart';
import 'package:halla/core/common/data/data%20source/local_user_data_source.dart';
import 'package:halla/core/common/data/data%20source/nfc_data_source.dart';
import 'package:halla/core/common/data/models/nfc_message_model.dart';
import 'package:halla/core/common/data/models/user_model.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/entities/nfc_message.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/repositories/common_repositories.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/error/server_exception.dart';

class CommonRepositoriesImpl implements CommonRepositories {
  final NfcDataSource nfcDataSource;
  final DataBaseSource dataBaseSource;
  final LocalUserDataSource localUserDataSource;
  CommonRepositoriesImpl(
    this.nfcDataSource,
    this.dataBaseSource,
    this.localUserDataSource,
  );

// user database
  @override
  Future<Either<Failure, User>> uploadUser({required User user}) async {
    try {
      UserModel userModel = UserModel.fromUser(user);
      final res = await dataBaseSource.uploadUser(userModel);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> getUser({required String userId}) async {
    try {
      final res = await dataBaseSource.getUser(userId);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

// NFC
  @override
  Future<Either<Failure, bool>> getIsNfcAvailable() async {
    try {
      final res = await nfcDataSource.getNFCIsAvailable();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> getIsNfcOpen() async {
    try {
      final res = await nfcDataSource.getNFCIsOpen();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, NfcUse>> writeOnNfc(NfcMessage nfcMessage) async {
    try {
      final res = await nfcDataSource.write(
        NfcMessageModel.fromNfcMessage(nfcMessage),
      );
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, NfcMessage>> readFromNfc() async {
    try {
      final res = await nfcDataSource.read();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  // guest

  @override
  Future<Either<Failure, Guest>> logInGuest() async {
    try {
      final res = await dataBaseSource.logInGuest();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, Guest>> getGuest() async {
    try {
      final res = await dataBaseSource.getGuest();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isGuestUpdate() async {
    try {
      final res = await dataBaseSource.isGuestUpdate();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isGuestExit() async {
    try {
      final res = await dataBaseSource.isGuestExit();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, void>> fotgetGuestPinCode() async {
    try {
      final res = await dataBaseSource.forgetGuestPinCode();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  // local user
  @override
  Future<Either<Failure, void>> addUserToLocal(User user) async {
    try {
      final res =
          await localUserDataSource.addUserToLocal(UserModel.fromUser(user));
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteUserFromLocal() async {
    try {
      final res = await localUserDataSource.deleteUserFromLocal();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, User>> getUserFromLocal() async {
    try {
      final res = await localUserDataSource.getUserFromLocal();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isUserSavedLocal() async {
    try {
      final res = await localUserDataSource.isUserSavedLocal();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }
}
