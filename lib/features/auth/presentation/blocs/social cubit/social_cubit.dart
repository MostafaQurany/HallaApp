import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/common/domain/usecase/get_is_nfc_available.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/features/auth/domain/usecases/google_login.dart';

part 'social_cubit.freezed.dart';
part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  // Cubits
  final UserCubit _userCubit;
  final GoogleLoginUseCase _googleLoginUseCase;
  final GetIsNfcAvailableUsecase _getIsNfcAvailable;

  SocialCubit(
    this._userCubit,
    this._googleLoginUseCase,
    this._getIsNfcAvailable,
  ) : super(const SocialState.initial());

  // google
  google() async {
    emit(SocialState.googleLoading());
    final res = await _googleLoginUseCase(NoParams());
    res.fold(
      (l) => emit(
        SocialState.googleError(
          l.message.toString(),
        ),
      ),
      (r) {
        _userCubit.updateUser(user: r['user']);
        emit(SocialState.googleSuccess(r));
      },
    );
  }

  // nfc
  getIsNfcAvailableEvent() async {
    final res = await _getIsNfcAvailable(NoParams());
    res.fold(
      (l) => emit(SocialState.nfcError(l.message)),
      (r) => emit(SocialState.nfcAvailable(r)),
    );
  }
}
