import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class GetContactListSyncUseCase
    implements UseCase<List<Contact>, GetContactListSyncPram> {
  final ContactsRepository contactsRepository;

  GetContactListSyncUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, List<Contact>>> call(
      GetContactListSyncPram params) async {
    return await contactsRepository.getContactListSync(userId: params.userId);
  }
}

class GetContactListSyncPram {
  String userId;

  GetContactListSyncPram({
    required this.userId,
  });
}
