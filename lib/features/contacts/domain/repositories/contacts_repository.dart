import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ContactsRepository {
  // add local and server
  Future<Either<Failure, void>> addContact({
    required String userId,
    required String contactId,
  });

// add list local and server
  Future<Either<Failure, void>> addContactList({
    required String userId,
    required List<String> contactIdList,
  });

// get list local and server
  Future<Either<Failure, List<Contact>>> getContactListSync({
    required String userId,
  });

  Future<Either<Failure, List<Contact>>> getContactList({
    required String userId,
  });

  // stream
  Future<Either<Failure, Stream<BoxEvent>>> getContactListStream({
    required String userId,
  });

  // delete contact local and server
  Future<Either<Failure, void>> deleteContact(
      {required String userId, required String contactId});
}
