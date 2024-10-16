import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class GetContactListLocalUseCase
    implements UseCase<List<Contact>, GetContactListLocalPram> {
  final ContactsRepository contactsRepository;

  GetContactListLocalUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, List<Contact>>> call(
      GetContactListLocalPram params) async {
    return await contactsRepository.getContactListLocal(userId: params.userId);
  }
}

class GetContactListLocalPram {
  String userId;

  GetContactListLocalPram({
    required this.userId,
  });
}
