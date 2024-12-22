import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';

class GetOfflineListContactUseCase
    implements UseCase<List<String>, GetOfflineListContactPram> {
  final ContactsRepository contactsRepository;

  GetOfflineListContactUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, List<String>>> call(
      GetOfflineListContactPram params) async {
    return await contactsRepository.getContactIdListFromLocal(
      userId: params.userId,
    );
  }
}

class GetOfflineListContactPram {
  String userId;

  GetOfflineListContactPram({
    required this.userId,
  });
}
