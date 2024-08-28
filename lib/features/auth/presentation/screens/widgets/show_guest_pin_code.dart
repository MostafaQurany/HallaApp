import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/home/presentation/screens/home_layout.dart';
import 'package:halla/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class ShowGuestPinCode extends StatelessWidget {
  const ShowGuestPinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoggedIn) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(AppImages.welcomePinCodeLottie),
              Text(
                S
                    .of(context)
                    .welcomeToHallayourPincodeForLoginIsStateuserpincodekeepItSecure(
                        state.user!.pinCode),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ElevatedButton(
                  onPressed: () {
                    AppNavigator.navigatePushReplaceRemoveAll(
                        context, const HomeLayout());
                  },
                  child: Text(S.of(context).next)),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
