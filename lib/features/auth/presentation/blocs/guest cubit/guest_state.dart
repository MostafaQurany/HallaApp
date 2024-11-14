part of 'guest_cubit.dart';

@freezed
class GuestState with _$GuestState {
  const factory GuestState.initial() = _Initial;

  const factory GuestState.loading() = Loading;

  const factory GuestState.error(String error) = Error;

  const factory GuestState.deleteGuestSuccess() = DeleteGuestSuccess;

  const factory GuestState.createNewGuestSuccess() = CreateNewGuestSuccess;

  const factory GuestState.loginGuestSuccess(Guest guest) = LoginGuestSuccess;

  const factory GuestState.isUpdateGuestSuccess(Guest guest) =
      IsUpdateGuestSuccess;
}
