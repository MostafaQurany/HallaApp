import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/presentation/cubit/connection/network_cubit.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/core/utils/shared_preferences.dart';
import 'package:halla/features/auth/presentation/screens/auth_screen.dart';
import 'package:halla/features/home/presentation/screens/home_layout.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /*
  * check the first time open
  * check the current connection
  * check where should to open
  */

  @override
  void initState() {
    super.initState();
    _checkingNetwork();
  }

  _checkingNetwork() async {
    bool isConnected =
        await context.read<NetworkCubit>().connectionChecker.hasConnection;
    User? user = await UserCubit.get(context).getUserFromLocal().then(
          (value) => UserCubit.get(context).user,
        );
    if (isConnected) {
      _checkIfFirstTimeOpen();
      if (user == null) {
        AppNavigator.navigatePushReplace(context, AuthScreen());
      } else {
        AppNavigator.navigatePushReplace(context, HomeLayout());
      }
    } else {
      if (user == null) {
        AppShowDialog.noInternetConnection(context);
      } else {
        AppNavigator.navigatePushReplace(context, HomeLayout());
      }
    }
  }

  _checkIfFirstTimeOpen() {
    MySharedPreferences.instance
        .getBooleanValue(
      AppConstants.firstTimeOpen,
    )
        .then(
      (value) {
        if (value == true) {
          // TODO: Open the onBoarding Screens
          AppNavigator.navigatePushReplace(
              context,
              Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                          onPressed: () {
                            MySharedPreferences.instance.setBooleanValue(
                                AppConstants.firstTimeOpen, false);
                          },
                          child: Text("data")),
                    ],
                  ),
                ),
              ));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flutter_dash_rounded),
            Lottie.asset(AppImages.loadingLottie),
          ],
        ),
      ),
    );
  }
}
