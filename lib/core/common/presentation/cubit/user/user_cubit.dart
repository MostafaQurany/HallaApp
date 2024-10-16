// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/domain/usecase/add_user_to_local_usecase.dart';
import 'package:halla/core/common/domain/usecase/delete_user_from_local_usecase.dart';
import 'package:halla/core/common/domain/usecase/get_user_from_local_usecase.dart';
import 'package:halla/core/common/domain/usecase/is_user_saved_local_usecase.dart';
import 'package:halla/core/common/domain/usecase/usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  AddUserToLocalUsecase addUserToLocalUsecase;
  GetUserFromLocalUsecase getUserFromLocalUsecase;
  IsUserSavedLocalUsecase isUserSavedLocalUsecase;
  DeleteUserFromLocalUsecase deleteUserFromLocalUsecase;
  UserCubit(
    this.addUserToLocalUsecase,
    this.getUserFromLocalUsecase,
    this.isUserSavedLocalUsecase,
    this.deleteUserFromLocalUsecase,
  ) : super(UserInitial());

  User? user;

  static UserCubit get(BuildContext context) => BlocProvider.of(context);

  void updateUser({
    User? user,
  }) {
    if (user == null) {
      emit(UserInitial());
    } else {
      this.user = user;
      if (!user.isGuest) addUserToLocal();
      emit(UserLoggedIn(
        user: user,
      ));
    }
  }

  Future<bool> isUserSavedToLocal() async {
    final res = await isUserSavedLocalUsecase(NoParams());
    return res.fold(
      (l) => false,
      (r) => r,
    );
  }

  Future<void> addUserToLocal() async {
    await addUserToLocalUsecase(AddUserToLocalUsecaseParams(user: user!));
  }

  Future<void> getUserFromLocal() async {
    final res = await getUserFromLocalUsecase(NoParams());
    return res.fold(
      (l) {
        updateUser(user: null);
      },
      (r) => updateUser(user: r),
    );
  }

  Future<void> deletUserFromLocal() async {
    final res = await deleteUserFromLocalUsecase(NoParams());
    res.fold(
      (l) => updateUser(user: null),
      (r) => updateUser(user: null),
    );
  }
}
