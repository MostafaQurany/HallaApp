import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/home/presentation/screens/home_screen.dart';
import 'package:halla/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class ShowGuestPinCode extends StatelessWidget {
  const ShowGuestPinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoggedIn) {
          if (!state.isUser) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(AppImages.welcomePinCodeLottie),
                Text(
                  """
Welcome to Halla,
Your PIN code for login is ${state.guest!.pinCode}.
Keep it secure and don't share it with anyone.""",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.justify,
                ),
                ElevatedButton(
                    onPressed: () {
                      AppNavigator.navigatePushReplaceRemoveAll(
                          context, const HomeScreen());
                    },
                    child: Text(S.of(context).next)),
              ],
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
