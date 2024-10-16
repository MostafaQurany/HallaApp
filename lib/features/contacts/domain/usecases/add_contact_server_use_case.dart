import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class AddContactServerUseCase implements UseCase<void, AddContactServerPram> {
  final ContactsRepository contactsRepository;

  AddContactServerUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, void>> call(AddContactServerPram params) async {
    return await contactsRepository.addContactServer(
        userId: params.userId, contactId: params.contactId);
  }
}

class AddContactServerPram {
  String userId;
  String contactId;
  AddContactServerPram({
    required this.userId,
    required this.contactId,
  });
}
