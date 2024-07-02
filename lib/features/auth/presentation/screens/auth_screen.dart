import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/app_images.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/screens/log%20in/login_screen.dart';
import 'package:halla/features/auth/presentation/screens/widgets/guest_button.dart';
import 'package:halla/features/auth/presentation/screens/widgets/register_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GuestButton(),
            Expanded(
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(AppTheme.isLight(context)
                        ? AppImages.registertionBackgroundlight
                        : AppImages.registertionBackgroundDark),
                    fit: BoxFit.fill,
                    width: 1.sw,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        Image(
                          image: AssetImage(AppImages.registertionVector),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const Text(
                          "Lorem sdflk nfjkn lkadsgijouasdhf iladjsbf idfubghasdijfb edlfijhbv hjsdfghjbsd dsfkjb sd fsbhj l dhnjfs djhfb lsnbdf jhdfb hjilg",
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            navigatePush(context, const LoginScreen());
                          },
                          child: const Text("Login"),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const RegisterButton(),
                        SizedBox(
                          height: 60.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
