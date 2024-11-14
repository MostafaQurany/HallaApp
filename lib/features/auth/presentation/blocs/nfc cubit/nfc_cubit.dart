import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/common/data/data%20source/nfc_data_source.dart';
import 'package:halla/core/common/domain/entities/nfc_message.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/usecase/get_is_nfc_available.dart';
import 'package:halla/core/common/domain/usecase/get_is_nfc_open.dart';
import 'package:halla/core/common/domain/usecase/read_from_nfc.dart';
import 'package:halla/core/common/domain/usecase/upload_user_usecase.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/common/domain/usecase/write_on_nfc.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';

part 'nfc_cubit.freezed.dart';
part 'nfc_state.dart';

class NfcCubit extends Cubit<NfcState> {
  // user cubit
  final UserCubit _userCubit;

  // core => nfc usecase
  final GetIsNfcAvailableUsecase _getIsNfcAvailable;
  final GetIsNfcOpenUsecase _getIsNfcOpen;
  final WriteOnNfcUsecase _writeOnNfcUsecase;
  final ReadFromNfc _readFromNfc;

  // databse
  final UploadUserUsecase _uploadUserUsecase;

  NfcCubit(
    this._getIsNfcAvailable,
    this._getIsNfcOpen,
    this._writeOnNfcUsecase,
    this._readFromNfc,
    this._uploadUserUsecase,
    this._userCubit,
  ) : super(const NfcState.initial());

  // nfc method
  getIsNfcAvailableEvent() async {
    final res = await _getIsNfcAvailable(NoParams());
    res.fold(
      (l) => emit(NfcState.nfcError(l.message)),
      (r) => emit(NfcState.nfcAvailable(r)),
    );
  }

  StreamSubscription<bool>? _nfcStatusSubscription;
  bool _shouldCloseNfcStatusStream = false;
  final StreamController<bool> _nfcStatusController = StreamController<bool>();

  getIsNfcOpenEvent() async {
    _shouldCloseNfcStatusStream = false;
    _nfcStatusSubscription = _getNFCStatusStream().listen(
      (isAvailable) {
        emit(NfcState.nfcState(isAvailable));
      },
      onError: (error) {
        emit(NfcState.nfcError(error.message));
      },
      cancelOnError: false, // Prevent stream from terminating on error
    );
  }

  Stream<bool> _getNFCStatusStream() async* {
    while (!_shouldCloseNfcStatusStream) {
      try {
        final res = await _getIsNfcOpen(NoParams());
        yield res.fold(
          (l) => throw l,
          // Re-throw error to be handled by onError callback
          (r) => r,
        );
      } catch (error) {
        print('Error checking NFC status: $error');
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void closeNfcStatusStream() {
    _shouldCloseNfcStatusStream = true;
    _nfcStatusSubscription?.cancel(); // Cancel the stream subscription
    _nfcStatusController.close();
  }

  writeOnNfcEvent({required NfcMessage nfcMessage}) async {
    final res = await _writeOnNfcUsecase(
      WriteOnNfcParam(nfcMessage: nfcMessage),
    );
    res.fold(
      (l) => emit(NfcState.nfcError(l.message)),
      (r) {
        _nfcStatusController.close();
        emit(NfcState.nfcLoading());
        emit(
          NfcState.nfcUseState(
            r,
            nfcMessage.id,
          ),
        );
      },
    );
  }

  readFromNfc() async {
    final res = await _readFromNfc(NoParams());
    res.fold(
      (l) => emit(NfcState.nfcError(l.message)),
      (r) => emit(
        NfcState.nfcReadNfc(r),
      ),
    );
  }

  authUploadUser(User user) async {
    final res = await _uploadUserUsecase(
      UploadUserParams(
        user: user,
      ),
    );
    res.fold(
      (l) {
        emit(NfcState.nfcError(l.message));
      },
      (r) {
        _userCubit.updateUser(user: r);
        closeNfcStatusStream();
        emit(NfcState.uploadUserSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    closeNfcStatusStream();
    return super.close();
  }
}
