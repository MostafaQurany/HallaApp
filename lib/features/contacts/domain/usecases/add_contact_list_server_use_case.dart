import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class AddContactListServerUseCase
    implements UseCase<void, AddContactListServerPram> {
  final ContactsRepository contactsRepository;

  AddContactListServerUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, void>> call(AddContactListServerPram params) async {
    return await contactsRepository.addContactListServer(
        userId: params.userId, contactIdList: params.contactIdList);
  }
}

class AddContactListServerPram {
  String userId;
  List<String> contactIdList;
  AddContactListServerPram({
    required this.userId,
    required this.contactIdList,
  });
}
