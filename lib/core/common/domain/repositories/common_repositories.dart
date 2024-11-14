import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/data/data%20source/nfc_data_source.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/entities/nfc_message.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';

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
