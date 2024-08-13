import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart';
import 'package:halla/features/auth/presentation/screens/widgets/social_icon.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialIcon(
      image: AppImages.facebookIcon,
      isSvg: false,
      onTap: () {
        // ToDo :- implement
      },
    );
  }
}
