import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart';
import 'package:halla/features/auth/presentation/screens/widgets/social_icon.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialIcon(
      image: AppImages.googleIconSvg,
      onTap: () {
        context.read<AuthBloc>().add(AuthGoogle());
      },
    );
  }
}
