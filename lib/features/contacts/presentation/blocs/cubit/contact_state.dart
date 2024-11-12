part of 'contact_cubit.dart';

@freezed
class ContactState with _$ContactState {
  const factory ContactState.initial() = _Initial;

  // add loading , Success and failure
  const factory ContactState.addContactSuccess() = AddContactSuccess;

  const factory ContactState.addContactFailure(String message) =
      AddContactFailure;

  const factory ContactState.addContactLoading() = AddContactLoading;

  // add loading , Success and failure
  const factory ContactState.addContactListSuccess() = AddContactListSuccess;

  const factory ContactState.addContactListFailure(String message) =
      AddContactListFailure;

  const factory ContactState.addContactListLoading() = AddContactListLoading;

  // delete contact  loading, Success and failure
  const factory ContactState.deleteContactSuccess() = DeleteContactSuccess;

  const factory ContactState.deleteContactFailure(String message) =
      DeleteContactFailure;

  const factory ContactState.deleteContactLoading() = DeleteContactLoading;

  // get stream box contact  loading, Success and failure
  const factory ContactState.getContactListStreamLoading() =
      GetContactListStreamLoading;

  const factory ContactState.getContactListStreamFailure(String message) =
      GetContactListStreamFailure;

  const factory ContactState.getContactListStreamSuccess(
      Stream<BoxEvent> streamer) = GetContactListStreamSuccess;

// get stream box contact  loading, Success and failure
  const factory ContactState.getContactListSyncLoading() =
      GetContactListSyncLoading;

  const factory ContactState.getContactListSyncFailure(String message) =
      GetContactListSyncFailure;

  const factory ContactState.getContactListSyncSuccess(
      List<Contact> contactList) = GetContactListSyncSuccess;

  // get loading , Success and failure
  const factory ContactState.getContactListSuccess(List<Contact> contactList) =
      GetContactListSuccess;

  const factory ContactState.getContactListFailure(String message) =
      GetContactListFailure;

  const factory ContactState.getContactListLoading() = GetContactListLoading;
}
