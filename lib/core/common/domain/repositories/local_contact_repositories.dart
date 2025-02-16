import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/core/native%20contact/data/native_local_contact_data_base_source.dart';

import '../entities/contact.dart';

abstract class LocalContactRepository {
  // add contact to the local device
  Future<Either<Failure, void>> addContactToLocalContacts(Contact contact);

  // get the contact from the local device
  Future<Either<Failure, List<Contact>>> getContactsFromLocalContacts();
}

class LocalContactRepositoryImpl extends LocalContactRepository {
  NativeLocalContactDataBaseSource contactNativeDataBaseSource;

  LocalContactRepositoryImpl(this.contactNativeDataBaseSource);

  @override
  Future<Either<Failure, void>> addContactToLocalContacts(
      Contact contact) async {
    try {
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Contact>>> getContactsFromLocalContacts() async {
    try {
      final res = await contactNativeDataBaseSource.getFirstTimeLocalContacts();
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
