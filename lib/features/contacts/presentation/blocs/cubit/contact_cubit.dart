import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/usecases/add_contact_list_usecase.dart';
import 'package:halla/features/contacts/domain/usecases/add_contact_usecase.dart';
import 'package:halla/features/contacts/domain/usecases/delete_contact_use_case.dart';
import 'package:halla/features/contacts/domain/usecases/get_contact_list_sync_usecase.dart';
import 'package:halla/features/contacts/domain/usecases/get_contact_list_use_case.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'contact_cubit.freezed.dart';
part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  static ContactCubit get(context) => BlocProvider.of(context);

  // done
  AddContactUseCase addContactUseCase;
  AddContactListUseCase addContactListUseCase;
  DeleteContactUseCase deleteContactUseCase;
  GetContactListSyncUseCase getContactListSyncUseCase;

  // not done

  GetContactListUseCase getContactListUseCase;

  ContactCubit(
      this.addContactListUseCase,
      this.addContactUseCase,
      this.deleteContactUseCase,
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
}
