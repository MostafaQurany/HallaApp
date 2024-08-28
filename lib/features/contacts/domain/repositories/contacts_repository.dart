import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ContactsRepository {
  Future<Either<Failure, Contact>> getContactLocal({
    required String userId,
    required String contactId,
  });
  Future<Either<Failure, List<Contact>>> getContactListLocal({
    required String userId,
  });
  Future<
          Either<Failure,
              ValueListenable<Box<Map>>>>
      getBoxListenable();
// loacl
  // Future<Either<Failure, void>> addContactLocal({
  //   required String userId,
  //   required String contactId,
  // });
  // Future<Either<Failure, void>> addContactListLocal({
  //   required String userId,
  //   required List<String> contactIdList,
  // });
  // Future<Either<Failure, void>> deleteContactLocal({
  //   required String userId,
  //   required Contact contact,
  // });
// server

  Future<Either<Failure, void>> addContactServer({
    required String userId,
    required String contactId,
  });
  Future<Either<Failure, void>> addContactListServer({
    required String userId,
    required List<String> contactIdList,
  });
  Future<Either<Failure, void>> deleteContactServer({
    required String userId,
    required Contact contact,
  });
  // Future<Either<Failure, Contact>> getContactServer({
  //   required String userId,
  //   required String contactId,
  // });
  // Future<Either<Failure, void>> getContactListServer({
  //   required String userId,
  // });
}
