import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/utils/encryption.dart';
import 'package:halla/features/contacts/domain/usecases/imports.dart';
import 'package:meta/meta.dart';

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
  }

  _onAddContactServerEvent(
    AddContactServerEvent event,
    Emitter<ContactsState> emit,
  ) async {
    emit(ContactsLoadingState());
    final res = await _addContactServerUseCase(
      AddContactServerPram(
        userId: event.userId,
        contactId: event.contactId,
      ),
    );
    res.fold(
      (l) {
        emit(ContactsErorrState(l.message));
      },
      (r) {
        emit(AddContactSuccessfully());
      },
    );
  }
}
