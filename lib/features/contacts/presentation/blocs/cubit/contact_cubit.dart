import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/usecases/add_contact_list_usecase.dart';
import 'package:halla/features/contacts/domain/usecases/add_contact_usecase.dart';
import 'package:halla/features/contacts/domain/usecases/delete_contact_use_case.dart';
import 'package:halla/features/contacts/domain/usecases/get_contact_list_stream_use_case.dart';
import 'package:halla/features/contacts/domain/usecases/get_contact_list_sync_usecase.dart';
import 'package:halla/features/contacts/domain/usecases/get_contact_list_use_case.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'contact_cubit.freezed.dart';
part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  // done
  AddContactUseCase addContactUseCase;
  AddContactListUseCase addContactListUseCase;
  DeleteContactUseCase deleteContactUseCase;
  GetContactListStreamUseCase getContactListStreamUseCase;
  GetContactListSyncUseCase getContactListSyncUseCase;

  // not done

  GetContactListUseCase getContactListUseCase;

  ContactCubit(
      this.addContactListUseCase,
      this.addContactUseCase,
      this.deleteContactUseCase,
      this.getContactListStreamUseCase,
      this.getContactListSyncUseCase,
      this.getContactListUseCase)
      : super(const ContactState.initial());

  addContact({
    required String userId,
    required String contactId,
  }) async {
    emit(ContactState.addContactLoading());
    final res = await addContactUseCase(
        AddContactPram(userId: userId, contactId: contactId));
    res.fold(
      (l) {
        emit(ContactState.addContactFailure(l.message));
      },
      (r) {
        emit(ContactState.addContactSuccess());
      },
    );
  }

  addContactList({
    required String userId,
    required List<String> contactIdList,
  }) async {
    emit(ContactState.addContactListLoading());
    final res = await addContactListUseCase(
        AddContactListPram(userId: userId, contactIdList: contactIdList));
    res.fold(
      (l) {
        emit(ContactState.addContactListFailure(l.message));
      },
      (r) {
        emit(ContactState.addContactListSuccess());
      },
    );
  }

  deleteContact({
    required String userId,
    required String contactId,
  }) async {
    emit(ContactState.deleteContactLoading());
    final res = await deleteContactUseCase(
        DeleteContactPram(userId: userId, contactId: contactId));
    res.fold(
      (l) {
        emit(ContactState.deleteContactFailure(l.message));
      },
      (r) {
        emit(ContactState.deleteContactSuccess());
      },
    );
  }

  getContactListStream({
    required String userId,
  }) async {
    emit(ContactState.getContactListStreamLoading());
    final res = await getContactListStreamUseCase(GetContactListStreamPram(
      userId: userId,
    ));
    res.fold(
      (l) {
        emit(ContactState.getContactListStreamFailure(l.message));
      },
      (r) {
        emit(ContactState.getContactListStreamSuccess(r));
      },
    );
  }

  getContactListSync({
    required String userId,
  }) async {
    emit(ContactState.getContactListSyncLoading());
    final res = await getContactListSyncUseCase(GetContactListSyncPram(
      userId: userId,
    ));
    res.fold(
      (l) {
        emit(ContactState.getContactListSyncFailure(l.message));
      },
      (r) {
        emit(ContactState.getContactListSyncSuccess(r));
      },
    );
  }

  getContactList({
    required String userId,
  }) async {
    emit(ContactState.getContactListLoading());
    final res = await getContactListUseCase(GetContactListPram(
      userId: 'userId', // replace with actual userId
    ));
    res.fold(
      (l) {
        emit(ContactState.getContactListFailure(l.message));
      },
      (r) {
        emit(ContactState.getContactListSuccess(r));
      },
    );
  }
}
