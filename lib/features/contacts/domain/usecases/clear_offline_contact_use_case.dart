import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class ClearOfflineContactUseCase
    implements UseCase<void, ClearOfflineContactPram> {
  final ContactsRepository contactsRepository;

  ClearOfflineContactUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, void>> call(ClearOfflineContactPram params) async {
    return await contactsRepository.clearContactIdToLocal(
      userId: params.userId,
    );
  }
}

class ClearOfflineContactPram {
  String userId;

  ClearOfflineContactPram({
    required this.userId,
  });
}
