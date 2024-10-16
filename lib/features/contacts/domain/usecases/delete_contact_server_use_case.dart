import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class DeleteContactServerUseCase
    implements UseCase<void, DeleteContactServerPram> {
  final ContactsRepository contactsRepository;

  DeleteContactServerUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, void>> call(DeleteContactServerPram params) async {
    return await contactsRepository.deleteContactServer(
        userId: params.userId, contact: params.contact);
  }
}

class DeleteContactServerPram {
  String userId;
  Contact contact;
  DeleteContactServerPram({
    required this.userId,
    required this.contact,
  });
}
