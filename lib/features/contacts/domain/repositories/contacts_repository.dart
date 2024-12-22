import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/contacts/data/data_sources/contacts_data_source.dart';
import 'package:halla/features/contacts/data/data_sources/contacts_local_data_source.dart';

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

  // delete contact local and server
  Future<Either<Failure, void>> deleteContact(
      {required String userId, required String contactId});

  // offline (addStrings to local , getContactList from local )
  Future<Either<Failure, List<String>>> getContactIdListFromLocal({
    required String userId,
  });

  Future<Either<Failure, List<String>>> addContactIdToLocal({
    required String userId,
    required String contactId,
  });

  Future<Either<Failure, void>> clearContactIdToLocal({
    required String userId,
  });
}

class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsDataSource server;
  final ContactsLocalDataSource local;

  ContactsRepositoryImpl(this.local, this.server);

  // add local and server
  @override
  Future<Either<Failure, void>> addContact({
    required String userId,
    required String contactId,
  }) async {
    try {
      Contact contactModel =
          await server.addContact(userId: userId, contactId: contactId);
      final r =
          await local.addContact(userId: userId, contactModel: contactModel);
      return Right(r);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  // add list local and server
  @override
  Future<Either<Failure, void>> addContactList({
    required String userId,
    required List<String> contactIdList,
  }) async {
    try {
      List<Contact> contactModel = await server.addContactList(
          userId: userId, contactIdList: contactIdList);
      final r =
          await local.addContactList(userId: userId, contactList: contactModel);
      return Right(r);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  // get list local and server

  //local.getContactList
  @override
  Future<Either<Failure, List<Contact>>> getContactList(
      {required String userId}) async {
    try {
      final r = await local.getContactList(userId: userId);
      return Right(r);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  //local and server
  @override
  Future<Either<Failure, List<Contact>>> getContactListSync(
      {required String userId}) async {
    try {
      List<Contact> contactModel = await server.getContactList(userId: userId);
      return await local
          .contactSync(userId: userId, contactList: contactModel)
          .then(
        (value) async {
          List<Contact> r = await local.getContactList(userId: userId);
          return Right(r);
        },
      );
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  // delete contact local and server
  @override
  Future<Either<Failure, void>> deleteContact(
      {required String userId, required String contactId}) async {
    try {
      await server.deleteContact(userId: userId, contactId: contactId);
      final r = await local.deleteContact(userId: userId, contactId: contactId);
      return Right(r);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  // offline add
  @override
  Future<Either<Failure, List<String>>> addContactIdToLocal(
      {required String userId, required String contactId}) async {
    try {
      final r =
          await local.addIdToOfflineList(userId: userId, contactId: contactId);
      return Right(r);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  // offline get
  @override
  Future<Either<Failure, List<String>>> getContactIdListFromLocal(
      {required String userId}) async {
    try {
      final r = await local.getIdFromOfflineList(userId: userId);
      return Right(r);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> clearContactIdToLocal({
    required String userId,
  }) async {
    try {
      final r = await local.clearOfflineContact(userId: userId);
      return Right(r);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
