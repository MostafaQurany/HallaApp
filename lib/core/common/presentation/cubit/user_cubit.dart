
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());


  void updateUser(User? user) {
    if (user == null) {
      emit(UserInitial());
    } else {
      emit(UserLoggedIn(user));
    }
  }
}
