import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:halla/features/contacts/domain/usecases/add_contact_list_usecase.dart';
import 'package:halla/features/contacts/domain/usecases/add_contact_usecase.dart';
import 'package:halla/features/contacts/domain/usecases/add_offline_contact_use_case.dart';
import 'package:halla/features/contacts/domain/usecases/clear_offline_contact_use_case.dart';
import 'package:halla/features/contacts/domain/usecases/delete_contact_use_case.dart';
import 'package:halla/features/contacts/domain/usecases/get_contact_list_sync_usecase.dart';
import 'package:halla/features/contacts/domain/usecases/get_contact_list_use_case.dart';
import 'package:halla/features/contacts/domain/usecases/get_offline_list_contact_use_case.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'contact_cubit.freezed.dart';
part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  static ContactCubit get(context) => BlocProvider.of(context);
  ContactsRepository contactsRepository;

  // done
  AddContactUseCase addContactUseCase;
  AddContactListUseCase addContactListUseCase;
  DeleteContactUseCase deleteContactUseCase;
  GetContactListSyncUseCase getContactListSyncUseCase;
  AddOfflineContactUseCase addOfflineContactUseCase;
  GetContactListUseCase getContactListUseCase;
  GetOfflineListContactUseCase getOfflineListUseCase;
  ClearOfflineContactUseCase clearofflineContactUseCase;

  ContactCubit(
    this.addContactListUseCase,
    this.getOfflineListUseCase,
    this.addContactUseCase,
    this.deleteContactUseCase,
    this.getContactListSyncUseCase,
    this.getContactListUseCase,
    this.addOfflineContactUseCase,
    this.clearofflineContactUseCase,
    this.contactsRepository,
  ) : super(const ContactState.initial());

  addContact({
    required String userId,
    required String contactId,
  }) async {
    emit(ContactState.addContactLoading());
    final res = await addContactUseCase(
        AddContactPram(userId: userId, contactId: contactId));
    res.fold(
      (l) {
        emit(ContactState.contactFailure(l.message));
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
        emit(ContactState.contactFailure(l.message));
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
        emit(ContactState.contactFailure(l.message));
      },
      (r) {
        emit(ContactState.deleteContactSuccess());
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
        emit(ContactState.contactFailure(l.message));
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
      userId: userId,
    ));
    res.fold(
      (l) {
        emit(ContactState.contactFailure(l.message));
      },
      (r) {
        print(r);
        emit(ContactState.getContactListSuccess(r));
      },
    );
  }

  // offline
  addOfflineContact({required String userId, required String contactId}) async {
    emit(ContactState.offlineLoading());
    final res = await addOfflineContactUseCase(
        AddOfflineContactPram(userId: userId, contactId: contactId));
    res.fold(
      (l) {
        emit(ContactState.contactFailure(l.message));
      },
      (r) {
        emit(ContactState.addContactListToOfflineSuccess(r));
      },
    );
  }

  getOfflineContact({required String userId}) async {
    emit(ContactState.offlineLoading());
    final res = await getOfflineListUseCase(GetOfflineListContactPram(
      userId: userId,
    ));
    res.fold(
      (l) {
        emit(ContactState.contactFailure(l.message));
      },
      (r) {
        emit(ContactState.getContactListFromOfflineSuccess(r));
      },
    );
  }

  clearOfflineContactList({required String userId}) async {
    emit(ContactState.offlineLoading());
    final res = await clearofflineContactUseCase(ClearOfflineContactPram(
      userId: userId,
    ));
    res.fold(
      (l) {
        emit(ContactState.contactFailure(l.message));
      },
      (r) {
        emit(ContactState.clearOfflineContactListSuccess());
      },
    );
  }
}
