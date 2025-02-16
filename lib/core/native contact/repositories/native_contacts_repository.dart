import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/native%20contact/data/native_local_contact_data_base_source.dart';

abstract class NativeContactsRepository {
  Future<Either<Failure, void>> addToLocalContacts(Contact contact);

  Future<Either<Failure, List<Contact>>> getLocalContacts();

  Future<Either<Failure, List<Contact>>> getFirstTimeLocalContacts();

  Future<Either<Failure, void>> addLocalContactToServer(Contact contact);
}

class NativeContactsRepositoryImpl implements NativeContactsRepository {
  NativeLocalContactDataBaseSource nativeLocalContactDataBaseSource;

  NativeContactsRepositoryImpl(this.nativeLocalContactDataBaseSource);

  @override
  Future<Either<Failure, List<Contact>>> getFirstTimeLocalContacts() async {
    try {
      final res =
          await nativeLocalContactDataBaseSource.getFirstTimeLocalContacts();
      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addToLocalContacts(Contact contact) async {
    try {
      final res =
          await nativeLocalContactDataBaseSource.addToLocalContacts(contact);
      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Contact>>> getLocalContacts() async {
    try {
      final res = await nativeLocalContactDataBaseSource.getLocalContacts();
      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addLocalContactToServer(Contact contact) async {
    try {
      final res = await nativeLocalContactDataBaseSource
          .addLocalContactToServer(contact);
      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
