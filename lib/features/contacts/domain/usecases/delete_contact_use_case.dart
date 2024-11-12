import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class DeleteContactUseCase implements UseCase<void, DeleteContactPram> {
  final ContactsRepository contactsRepository;

  DeleteContactUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, void>> call(DeleteContactPram params) async {
    return await contactsRepository.deleteContact(
        userId: params.userId, contactId: params.contactId);
  }
}

class DeleteContactPram {
  String userId;
  String contactId;
  DeleteContactPram({
    required this.userId,
    required this.contactId,
  });
}
