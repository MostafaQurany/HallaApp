import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:halla/features/contacts/domain/usecases/imports.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final AddContactServerUseCase _addContactServerUseCase;
  final AddContactListServerUseCase _addContactListServerUseCase;
  final DeleteContactServerUseCase _deleteContactServerUseCase;
  final GetBoxListenableUseCase _getBoxListenableUseCase;
  final GetContactListLocalUseCase _getContactListLocalUseCase;
  final GetContactLocalUseCase _getContactLocalUseCase;

  ContactsBloc(
    this._addContactServerUseCase,
    this._addContactListServerUseCase,
    this._deleteContactServerUseCase,
    this._getBoxListenableUseCase,
    this._getContactListLocalUseCase,
    this._getContactLocalUseCase,
  ) : super(ContactsInitial()) {
    on<ContactsEvent>(
      (event, emit) {},
    );
    on<AddContactServerEvent>(
      _onAddContactServerEvent,
    );
    on<GetContactsListEvent>(
      _onGetContactsListEvent,
    );
  }

  _onAddContactServerEvent(
    AddContactServerEvent event,
    Emitter<ContactsState> emit,
  ) async {
    emit(AddContactsLoadingState());
    final res = await _addContactServerUseCase(
      AddContactServerPram(
        userId: event.userId,
        contactId: event.contactId,
      ),
    );
    res.fold(
      (l) {
        emit(AddContactsErorrState(l.message));
      },
      (r) {
        emit(AddContactSuccessfully());
      },
    );
  }

  _onGetContactsListEvent(
    GetContactsListEvent event,
    Emitter<ContactsState> emit,
  ) async {
    emit(GetContactsLoadingState());
    final res = await _getContactListLocalUseCase(
      GetContactListLocalPram(
        userId: event.userId,
      ),
    );
    res.fold(
      (l) {
        emit(GetContactsErorrState(l.message));
      },
      (r) {
        emit(GetContactsSuccessfully(contacts: r));
      },
    );
  }

  Future<ValueListenable<Box<Map>>?> getValueListenableBox() async {
    return await _getBoxListenableUseCase(
      NoParams(),
    ).then(
      (value) {
        return value.fold(
          (l) {
            return null;
          },
          (r) {
            return r;
          },
        );
      },
    );
  }
}
