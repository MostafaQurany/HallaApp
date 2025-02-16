import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/common/domain/entities/contact.dart';

import '../repositories/native_contacts_repository.dart';

part 'native_contacts_cubit.freezed.dart';
part 'native_contacts_state.dart';

class NativeContactsCubit extends Cubit<NativeContactsState> {
  NativeContactsRepository nativeContactsRepository;

  NativeContactsCubit(
    this.nativeContactsRepository,
  ) : super(const NativeContactsState.initial());

  // add , get and get for first time

  addContactToLocal(Contact contact) async {
    emit(NativeContactsState.loading());
    final res = await nativeContactsRepository.addToLocalContacts(contact);
    res.fold(
      (l) {
        emit(NativeContactsState.error(l.message));
      },
      (r) {
        emit(NativeContactsState<void>.loaded(r));
      },
    );
  }

  getContactFromLocalForFirstTime() async {
    emit(NativeContactsState.loading());
    final res = await nativeContactsRepository.getFirstTimeLocalContacts();
    res.fold(
      (l) {
        emit(NativeContactsState.error(l.message));
      },
      (r) {
        emit(NativeContactsState<List<Contact>>.loaded(r));
      },
    );
  }

  // get contact list
  getContactList() async {
    emit(NativeContactsState.loading());
    final res = await nativeContactsRepository.getLocalContacts();
    res.fold(
      (l) {
        emit(NativeContactsState.error(l.message));
      },
      (r) {
        emit(NativeContactsState<List<Contact>>.loaded(r));
      },
    );
  }

  addLocalContactToServer(Contact contact) async {
    emit(NativeContactsState.loading());
    final res = await nativeContactsRepository.addLocalContactToServer(contact);
    res.fold(
      (l) {
        emit(NativeContactsState.error(l.message));
      },
      (r) {
        emit(NativeContactsState<void>.loaded(r));
      },
    );
  }
}
