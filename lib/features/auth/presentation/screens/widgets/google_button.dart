import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/blocs/sign%20cubit/sign_in_cubit.dart';
import 'package:halla/features/auth/presentation/blocs/social%20cubit/social_cubit.dart';
import 'package:halla/features/auth/presentation/screens/widgets/social_icon.dart';
import 'package:halla/features/home/presentation/screens/home_layout.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocialCubit, SocialState>(
      listener: (context, state) {
        state.whenOrNull(
          googleLoading: () => AppShowDialog.loading(context),
          googleError: (errorMessage) =>
              AppShowDialog.error(context, errorMessage),
          googleSuccess: (userState) {
            if (userState['isExit'] == true) {
              AppNavigator.navigatePushReplaceRemoveAll(context, HomeLayout());
            } else {
              context.read<SignInCubit>().getIsNfcAvailableEvent();
            }
          },
        );
      },
      child: SocialIcon(
        image: AppImages.googleIcon,
        isSvg: false,
        onTap: () {
          context.read<SocialCubit>().google();
        },
      ),
    );
  }
}
