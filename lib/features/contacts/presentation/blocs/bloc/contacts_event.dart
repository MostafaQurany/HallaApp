part of 'contacts_bloc.dart';

@immutable
sealed class ContactsEvent {}

class AddContactServerEvent extends ContactsEvent {
  final String userId;
  final String contactId;
  AddContactServerEvent({
    required this.userId,
    required this.contactId,
  });
}

class GetContactsListEvent extends ContactsEvent {
  final String userId;
  GetContactsListEvent({required this.userId});
}
