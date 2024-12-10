part of 'contact_cubit.dart';

@freezed
class ContactState with _$ContactState {
  const factory ContactState.initial() = _Initial;

  // add loading , Success and failure
  const factory ContactState.addContactSuccess() = AddContactSuccess;

  const factory ContactState.addContactLoading() = AddContactLoading;

  // add loading , Success and failure
  const factory ContactState.addContactListSuccess() = AddContactListSuccess;

  const factory ContactState.addContactListLoading() = AddContactListLoading;

  // delete contact  loading, Success and failure
  const factory ContactState.deleteContactSuccess() = DeleteContactSuccess;

  const factory ContactState.deleteContactLoading() = DeleteContactLoading;

  // get stream box contact  loading, Success and failure
  const factory ContactState.getContactListStreamLoading() =
      GetContactListStreamLoading;

  const factory ContactState.getContactListStreamSuccess(
      Stream<BoxEvent> streamer) = GetContactListStreamSuccess;

// get stream box contact  loading, Success and failure
  const factory ContactState.getContactListSyncLoading() =
      GetContactListSyncLoading;

  const factory ContactState.getContactListSyncSuccess(
      List<Contact> contactList) = GetContactListSyncSuccess;

  // get loading , Success and failure
  const factory ContactState.getContactListSuccess(List<Contact> contactList) =
      GetContactListSuccess;

  const factory ContactState.getContactListLoading() = GetContactListLoading;

  // failure
  const factory ContactState.contactFailure(String error) = ContactFailure;
}
