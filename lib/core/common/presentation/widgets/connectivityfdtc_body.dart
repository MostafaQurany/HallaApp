import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart';
import 'package:halla/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class ConnectivityFDTCBody extends StatelessWidget {
  const ConnectivityFDTCBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(AppImages.disconnectConnectionLottie),
          Text(S.of(context).warning),
        ],
      ),
      content: Text(""),
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
            context.read<AuthBloc>().add(AuthForgetPinCodeGuestEvent());
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
