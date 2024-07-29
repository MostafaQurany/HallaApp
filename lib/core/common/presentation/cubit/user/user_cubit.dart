import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/utils/enums.dart';


part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  
  UserCubit() : super(UserInitial());
  
  UserType userType = UserType.user;

  User? user;
  Guest? guest;

  static UserCubit get(BuildContext context) => BlocProvider.of(context);

  void updateUser({
    User? user,
    Guest? guest,
    UserType userType = UserType.user,
  }) {
    if (userType == UserType.user) {
      if (user == null) {
        emit(UserInitial());
      } else {
        this.user = user;
        emit(UserLoggedIn(
          user: user,
          isUser:true,
        )); 
      }
    } else {
      this.userType = UserType.guest;
      if (guest == null) {
        emit(UserInitial());
      } else {
        emit(UserLoggedIn(
          guest: guest,
          isUser: false,
        ));
      }
    }
  }

  bool isUser() {
    return userType == UserType.user;
  }
}
