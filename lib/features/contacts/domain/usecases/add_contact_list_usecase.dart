import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class AddContactListUseCase implements UseCase<void, AddContactListPram> {
  final ContactsRepository contactsRepository;

  AddContactListUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, void>> call(AddContactListPram params) async {
    return await contactsRepository.addContactList(
      userId: params.userId,
      contactIdList: params.contactIdList,
    );
  }
}

class AddContactListPram {
  String userId;
  List<String> contactIdList;

  AddContactListPram({
    required this.userId,
    required this.contactIdList,
  });
}
