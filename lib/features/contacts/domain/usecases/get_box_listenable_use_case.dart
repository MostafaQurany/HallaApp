import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/usecase/usecase.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GetBoxListenableUseCase
    implements UseCase<ValueListenable<Box<Map<String, Contact>>>, NoParams> {
  final ContactsRepository contactsRepository;

  GetBoxListenableUseCase(this.contactsRepository);

  @override
  Future<Either<Failure, ValueListenable<Box<Map<String, Contact>>>>> call(
      NoParams params) async {
    return await contactsRepository.getBoxListenable();
  }
}
