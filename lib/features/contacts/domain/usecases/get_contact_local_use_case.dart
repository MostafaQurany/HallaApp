import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class GetContactLocalUseCase implements UseCase<Contact, GetContactLocalPram> {
  final ContactsRepository contactsRepository;

  GetContactLocalUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, Contact>> call(GetContactLocalPram params) async {
    return await contactsRepository.getContactLocal(
        userId: params.userId, contactId: params.contactId);
  }
}

class GetContactLocalPram {
  String userId;
  String contactId;
  GetContactLocalPram({
    required this.userId,
    required this.contactId,
  });
}
