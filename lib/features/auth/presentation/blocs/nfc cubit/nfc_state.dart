part of 'nfc_cubit.dart';

@freezed
class NfcState with _$NfcState {
  const factory NfcState.initial() = _Initial;

  // nfc states
  const factory NfcState.nfcAvailable(bool isAvailable) = NFCAvailable;

  const factory NfcState.nfcLoading() = NfcLoading;

  const factory NfcState.nfcError(String error) = NFCError;

  const factory NfcState.nfcState(bool isOpen) = NFCState;

  const factory NfcState.nfcUseState(
    NfcUse nfcUseState,
    String nfcId,
  ) = NFCUseState;

  const factory NfcState.nfcReadNfc(NfcMessage nfcMessage) = NFCReadNfc;

  // upload user state
  const factory NfcState.uploadUserLoading() = UploadUserLoading;

  const factory NfcState.uploadUserError(String message) = UploadUserError;

  const factory NfcState.uploadUserSuccess() = UploadUserSuccess;
}
