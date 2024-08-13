import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/contacts/data/data_sources/contacts_data_source.dart';
import 'package:halla/features/contacts/data/data_sources/contacts_local_data_source.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:hive/hive.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsDataSource server;
  final ContactsLocalDataSource local;

  ContactsRepositoryImpl(this.local, this.server);

//server
  @override
  Future<Either<Failure, void>> addContactListServer(
      {required String userId, required List<String> contactIdList}) async {
    try {
      final res = await server.addContactList(
          userId: userId, contactIdList: contactIdList);
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> addContactServer(
      {required String userId, required String contactId}) async {
    try {
      final res = await server.addContact(userId: userId, contactId: contactId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteContactServer(
      {required String userId, required Contact contact}) async {
    try {
      ContactModel contactModel = ContactModel.fromContact(contact);
      final res = await server.deleteContact(
          userId: userId, contactModel: contactModel);
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
  // local

  @override
  Future<Either<Failure, ValueListenable<Box<Map>>>>
      getBoxListenable() async {
    try {
      final res = await local.getContactModelBoxListenable();
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Contact>>> getContactListLocal(
      {required String userId}) async {
    try {
      final res = await local.getContactList(userId: userId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Contact>> getContactLocal(
      {required String userId, required String contactId}) async {
    try {
      final res = await local.getContact(userId: userId, contactId: contactId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
