import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GetContactListStreamUseCase
    implements UseCase<Stream<BoxEvent>, GetContactListStreamPram> {
  final ContactsRepository contactsRepository;

  GetContactListStreamUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, Stream<BoxEvent>>> call(
      GetContactListStreamPram params) async {
    return await contactsRepository.getContactListStream(
      userId: params.userId,
    );
  }
}

class GetContactListStreamPram {
  String userId;
  GetContactListStreamPram({
    required this.userId,
  });
}
