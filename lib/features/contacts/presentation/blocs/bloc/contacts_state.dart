part of 'contacts_bloc.dart';

@immutable
sealed class ContactsState {}

final class ContactsInitial extends ContactsState {}

final class ContactsLoadingState extends ContactsState {}

final class AddContactsLoadingState extends ContactsState {}

final class GetContactsLoadingState extends ContactsState {}

final class AddContactsErorrState extends ContactsState {
  final String message;
  AddContactsErorrState(this.message) {
    print("Error is $message ");
  }
}

final class GetContactsErorrState extends ContactsState {
  final String message;
  GetContactsErorrState(this.message) {
    print("Error is $message ");
  }
}

final class AddContactSuccessfully extends ContactsState {}

final class GetContactsSuccessfully extends ContactsState {
  final List<Contact> contacts;

  GetContactsSuccessfully({required this.contacts});
}
