import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/entities/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  User? user;

  static UserCubit get(BuildContext context) => BlocProvider.of(context);

  void updateUser({
    User? user,
  }) {
    if (user == null) {
      emit(UserInitial());
    } else {
      this.user = user;
      emit(UserLoggedIn(
        user: user,
      ));
    }
  }
}
