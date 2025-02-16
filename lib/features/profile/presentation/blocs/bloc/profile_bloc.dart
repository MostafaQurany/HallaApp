import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:halla/core/common/domain/entities/user.dart' as MyUser;
import 'package:halla/core/common/domain/usecase/upload_user_usecase.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/notification/repositories/notification_repositories.dart';
import 'package:halla/features/profile/domain/usecases/get_image_url_usecase.dart';
import 'package:halla/features/profile/domain/usecases/set_image_url_usecase.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SetImageUrlUsecase setImageUrlUseCase;
  final GetImageUrlUsecase getImageUrlUseCase;
  final UploadUserUsecase uploadUserUseCase;
  final UserCubit userCubit;
  bool isLoading = false;

  ProfileBloc(
    this.setImageUrlUseCase,
    this.getImageUrlUseCase,
    this.uploadUserUseCase,
    this.userCubit,
  ) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});

    on<LogOutEvent>(
      (event, emit) {
        FirebaseAuth.instance.signOut();
        GoogleSignIn().signOut();
        userCubit.deleteUserFromLocal();
        emit(LogOutSuccesState());
      },
    );

    on<SetImageEvent>(_onSetImageEvent);
    on<UpdateUserEvent>(_onUpdateUserEvent);
  }

  _loading(Emitter<ProfileState> emit) {
    if (!isLoading) {
      isLoading = !isLoading;
      emit(ProfileLoading());
    }
  }

  _onSetImageEvent(SetImageEvent event, Emitter<ProfileState> emit) async {
    _loading(emit);

    final res = await setImageUrlUseCase(
        SetImageUrlParams(userId: event.userId, image: event.image));
    res.fold(
      (l) {
        isLoading = !isLoading;
        emit(ProfileError(l.message));
      },
      (r) {
        isLoading = !isLoading;
        emit(ProfileImageUpdateSuccessfully(
          imageUrl: r,
        ));
      },
    );
  }

  _onUpdateUserEvent(
    UpdateUserEvent event,
    Emitter<ProfileState> emit,
  ) async {
    _loading(emit);
    final res = await uploadUserUseCase(
      UploadUserParams(user: event.user),
    );
    res.fold(
      (l) {
        isLoading = !isLoading;
        emit(ProfileError(l.message));
      },
      (r) {
        isLoading = !isLoading;
        userCubit.updateUser(user: r);
        emit(ProfileUpdateUserSuccessfully(
          user: r,
        ));
      },
    );
  }
}
