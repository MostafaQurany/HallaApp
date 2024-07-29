import 'package:halla/features/contacts/data/data_sources/contacts_data_source.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

/// ContactsRepositoryImpl is the concrete implementation of the ContactsRepository
/// interface.
/// This class implements the methods defined in ContactsRepository to interact
/// with data. It acts as a bridge between the domain layer
/// (use cases) and the data layer (data sources).
class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsDataSource contactsDataSource;
  ContactsRepositoryImpl(this.contactsDataSource);
}
