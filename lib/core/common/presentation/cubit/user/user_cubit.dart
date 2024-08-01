import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/entities/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  User? user;
  Guest? guest;
  bool _isUser = true;

  static UserCubit get(BuildContext context) => BlocProvider.of(context);

  void updateUser({
    User? user,
    Guest? guest,
  }) {
    if (user == null && guest == null) {
      emit(UserInitial());
    } else if (user != null && guest == null) {
      this.user = user;
      _isUser = true;
      emit(UserLoggedIn(
        user: user,
        isUser: true,
      ));
    } else if (user == null && guest != null) {
      this.guest = guest;
      _isUser = false;
      emit(UserLoggedIn(
        guest: guest,
        isUser: false,
      ));
    }
  }

  get isUser => _isUser;
}
