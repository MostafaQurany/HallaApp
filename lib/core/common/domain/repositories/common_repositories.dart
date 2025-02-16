import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/data/data_base_source.dart';
import 'package:halla/core/common/data/local_user_data_source.dart';
import 'package:halla/core/common/data/nfc_data_source.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/entities/nfc_message.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/core/native%20contact/data/native_local_contact_data_base_source.dart';

abstract interface class CommonRepositories {
  Future<Either<Failure, User>> uploadUser({required User user});

  Future<Either<Failure, User>> getUser({required String userId});

  Future<Either<Failure, bool>> getIsNfcAvailable();

  Future<Either<Failure, bool>> getIsNfcOpen();

  Future<Either<Failure, NfcUse>> writeOnNfc(NfcMessage nfcMessage);

  Future<Either<Failure, NfcMessage>> readFromNfc();

  Future<Either<Failure, Guest>> logInGuest();

  Future<Either<Failure, Guest?>> getGuest();

  Future<Either<Failure, void>> forgetGuestPinCode();

  Future<Either<Failure, bool>> isUserSavedLocal();

  Future<Either<Failure, void>> addUserToLocal(User user);

  Future<Either<Failure, User>> getUserFromLocal();

  Future<Either<Failure, void>> deleteUserFromLocal();

  Future<Either<Failure, List<Contact>>> getFirstTimeLocalContacts();
}

class CommonRepositoriesImpl implements CommonRepositories {
  final NfcDataSource nfcDataSource;
  final DataBaseSource dataBaseSource;
  final LocalUserDataSource localUserDataSource;
  final NativeLocalContactDataBaseSource nativeLocalContactDataBaseSource;

  CommonRepositoriesImpl(
    this.nfcDataSource,
    this.dataBaseSource,
    this.localUserDataSource,
    this.nativeLocalContactDataBaseSource,
  );

// user database
  @override
  Future<Either<Failure, User>> uploadUser({required User user}) async {
    try {
      final res = await dataBaseSource.uploadUser(user);
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
        NfcMessage.fromNfcMessage(nfcMessage),
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
  Future<Either<Failure, Guest?>> getGuest() async {
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
  Future<Either<Failure, void>> forgetGuestPinCode() async {
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
      final res = await localUserDataSource.addUserToLocal(user);
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

  @override
  Future<Either<Failure, List<Contact>>> getFirstTimeLocalContacts() async {
    try {
      final res =
          await nativeLocalContactDataBaseSource.getFirstTimeLocalContacts();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message),
      );
    }
  }
}
