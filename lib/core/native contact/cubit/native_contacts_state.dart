part of 'native_contacts_cubit.dart';

@freezed
class NativeContactsState<T> with _$NativeContactsState {
  const factory NativeContactsState.initial() = _Initial;

  const factory NativeContactsState.loading() = Loading;

  const factory NativeContactsState.loaded(T data) = Loaded;

  const factory NativeContactsState.error(String message) = Error;
}
