part of 'contacts_bloc.dart';

@immutable
sealed class ContactsState {}

final class ContactsInitial extends ContactsState {}

final class ContactsLoadingState extends ContactsState {}

final class ContactsErorrState extends ContactsState {
  final String message;
  ContactsErorrState(this.message); 
}

final class AddContactSuccessfully extends ContactsState {}
