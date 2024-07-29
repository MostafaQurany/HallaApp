import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/features/auth/presentation/screens/log%20in/login_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/guest_button.dart";
import "package:halla/features/auth/presentation/screens/widgets/register_button.dart";
import "package:halla/generated/l10n.dart";

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const GuestButton(),
              Expanded(
                flex: 1,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 1.sw,
                      child: Image(
                        image: AssetImage(
                          AppTheme.isLight(context)
                              ? AppImages.registertionBackgroundlight
                              : AppImages.registertionBackgroundDark,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView(
                        physics: const RangeMaintainingScrollPhysics(),
                        children: <Widget>[
                          SizedBox(
                            height: 25.h,
                          ),
                          Image(
                            image: AssetImage(AppImages.registertionVector),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            "Lorem sdflk nfjkn lkadsgijouasdhf iladjsbf idfubghasdijfb edlfijhbv hjsdfghjbsd dsfkjb sd fsbhj l dhnjfs djhfb lsnbdf jhdfb hjilg",
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              AppNavigator.navigatePush(
                                  context, const LoginScreen());
                            },
                            child: Text(
                              S.of(context).login,
                            ),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
