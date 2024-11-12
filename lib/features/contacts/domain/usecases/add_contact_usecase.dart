import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class AddContactUseCase implements UseCase<void, AddContactPram> {
  final ContactsRepository contactsRepository;

  AddContactUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, void>> call(AddContactPram params) async {
    return await contactsRepository.addContact(
      userId: params.userId,
      contactId: params.contactId,
    );
  }
}

class AddContactPram {
  String userId;
  String contactId;

  AddContactPram({
    required this.userId,
    required this.contactId,
  });
}
