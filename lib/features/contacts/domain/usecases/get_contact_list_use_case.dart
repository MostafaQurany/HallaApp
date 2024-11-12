import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class GetContactListUseCase
    implements UseCase<List<Contact>, GetContactListPram> {
  final ContactsRepository contactsRepository;

  GetContactListUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, List<Contact>>> call(GetContactListPram params) async {
    return await contactsRepository.getContactList(
      userId: params.userId,
    );
  }
}

class GetContactListPram {
  String userId;

  GetContactListPram({
    required this.userId,
  });
}
