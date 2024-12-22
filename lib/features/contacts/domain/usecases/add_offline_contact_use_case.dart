import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class AddOfflineContactUseCase
    implements UseCase<List<String>, AddOfflineContactPram> {
  final ContactsRepository contactsRepository;

  AddOfflineContactUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, List<String>>> call(
      AddOfflineContactPram params) async {
    return await contactsRepository.addContactIdToLocal(
      userId: params.userId,
      contactId: params.contactId,
    );
  }
}

class AddOfflineContactPram {
  String userId;
  String contactId;

  AddOfflineContactPram({
    required this.userId,
    required this.contactId,
  });
}
