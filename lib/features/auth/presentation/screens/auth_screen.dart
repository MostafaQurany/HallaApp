import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/common/presentation/cubit/connection/network_cubit.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/app_show_dialog.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/features/auth/presentation/screens/log%20in/login_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/guest_button.dart";
import "package:halla/features/auth/presentation/screens/widgets/register_button.dart";
import "package:halla/generated/l10n.dart";

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocListener<NetworkCubit, NetworkState>(
        listener: (context, state) {
          state.whenOrNull(
            disconnected: () {
              AppShowDialog.noInternetConnection(context);
            },
          );
        },
        child: Scaffold(
          body: SafeArea(
            child: SizedBox(
              height: 1.sh,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: 1.sw,
                      height: 0.89.sh,
                      child: Image(
                        image: AssetImage(
                          AppTheme.isLight(context)
                              ? AppImages.registertionBackgroundlight
                              : AppImages.registertionBackgroundDark,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: [
                              Image(
                                image: AssetImage(AppImages.registertionVector),
                                height: 0.4.sh,
                              ),
                              const Text(
                                "Lorem sdflk nfjkn lkadsgijouasdhf iladjsbf idfubghasdijfb edlfijhbv hjsdfghjbsd dsfkjb sd fsbhj l dhnjfs djhfb lsnbdf jhdfb hjilg",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
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
                                height: 15.h,
                              ),
                              const RegisterButton(),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const GuestButton(),
                ],
              ),
            ),
          ),
        ),
      );
}
