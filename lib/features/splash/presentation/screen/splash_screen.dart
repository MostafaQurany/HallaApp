import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/presentation/cubit/connectivity/connectivity_cubit.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/core/utils/shared_preferences.dart';
import 'package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart';
import 'package:halla/features/auth/presentation/screens/auth_screen.dart';
import 'package:halla/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:halla/features/home/presentation/screens/home_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirstLaunch = false;

  @override
  void initState() {
    super.initState();
    // first time open
    sharedState();
    // get user from local
  }

  sharedState() {
    MySharedPreferences.instance.getBooleanValue("isfirstRun").then(
          (value) => setState(
            () {
              isFirstLaunch = value;
              if (isFirstLaunch) {
                MySharedPreferences.instance.setBooleanValue(
                  'isfirstRun',
                  false,
                );
              }
              pushScreens();
            },
          ),
        );
  }

  void pushScreens() {
    if (isFirstLaunch) {
      // push to the onBoarding screen
    } else {
      userChecked();
    }
  }

  userChecked() async {
    print(await UserCubit.get(context).isUserSavedToLocal());
    if (await UserCubit.get(context).isUserSavedToLocal()) {
      await UserCubit.get(context).getUserFromLocal().then(
        (value) async {
          if (await getConnectionState()) {
            context.read<AuthBloc>().add(
                  AuthGetUserDataEvent(
                    user: UserCubit.get(context).user!,
                  ),
                );
          } else {
            AppNavigator.navigatePushReplaceRemoveAll(
                context, const ContactsScreen());
          }
        },
      );
    } else {
      if (await getConnectionState()) {
        AppNavigator.navigatePushReplaceRemoveAll(context, const AuthScreen());
      } else {
        // out of app
        print("Out of app ");
      }
    }
  }

  Future<bool> getConnectionState() async {
    return await ConnectivityCubit.get(context).getCurrentSateConnetion();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          AppShowDialog.loading(context);
        }
        if (state is AuthFailure) {
          AppNavigator.navigatePop(context);
          AppShowDialog.showErrorMessage(context, state.message);
        }
        if (state is AuthSuccess) {
          AppNavigator.navigatePop(context);
          AppNavigator.navigatePushReplaceRemoveAll(
              context, const HomeLayout());
        }
      },
      child: const Scaffold(
        body: Icon(Icons.flutter_dash),
      ),
    );
  }
}
