import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/features/auth/presentation/blocs/guest%20cubit/guest_cubit.dart';
import 'package:halla/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class DeleteGuestDialogBody extends StatelessWidget {
  const DeleteGuestDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(AppImages.warningLottie),
          Text(S.of(context).warning),
        ],
      ),
      content: Text(S.of(context).ifYouConfirmAllExistingDataWillBeLost),
      actions: [
        TextButton(
          child: Text(S.of(context).cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(S.of(context).confirm),
          onPressed: () {
            context.read<GuestCubit>().forgetGuestPinCode();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
