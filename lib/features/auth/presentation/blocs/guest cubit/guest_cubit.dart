import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/usecase/forget_pin_code_guest.dart';
import 'package:halla/core/common/domain/usecase/get_guest.dart';
import 'package:halla/core/common/domain/usecase/log_in_guest.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';

part 'guest_cubit.freezed.dart';
part 'guest_state.dart';

class GuestCubit extends Cubit<GuestState> {
  final UserCubit _userCubit;
  final LogInGuest _logInGuest;
  final GetGuest _getGuest;

  final ForgetPinCodeGuestUseCase _forgetPinCodeGuestUseCase;

  GuestCubit(
    this._logInGuest,
    this._forgetPinCodeGuestUseCase,
    this._userCubit,
    this._getGuest,
  ) : super(const GuestState.initial());

  logInGuestEvent() async {
    emit(GuestState.loading());
    final getGuestRes = await _getGuest(NoParams());
    await getGuestRes.fold(
      (l) {
        emit(GuestState.error(l.message));
        Future.value();
      },
      (guest) async {
        if (guest == null) {
          await _createNewGuest();
        } else {
          if (guest.isUpGraded) {
            emit(GuestState.isUpdateGuestSuccess(guest));
          } else {
            emit(GuestState.loginGuestSuccess(guest));
          }
        }
        Future.value();
      },
    );
  }

  _createNewGuest() async {
    final res = await _logInGuest(NoParams());
    res.fold(
      (l) {
        emit(GuestState.error(l.message));
      },
      (r) {
        _userCubit.updateUser(user: r);
        emit(GuestState.createNewGuestSuccess());
      },
    );
  }

  forgetGuestPinCode() async {
    final res = await _forgetPinCodeGuestUseCase(NoParams());
    res.fold(
      (l) {
        emit(GuestState.error(l.message));
      },
      (r) {
        emit(GuestState.deleteGuestSuccess());
      },
    );
  }
}
