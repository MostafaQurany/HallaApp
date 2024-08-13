import "package:app_settings/app_settings.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart";
import "package:halla/features/auth/presentation/screens/log%20in/pin_code_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/social_icon.dart";
import "package:halla/generated/l10n.dart";
import "package:lottie/lottie.dart";

class NfcButton extends StatelessWidget {
  const NfcButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialIcon(
      isSvg: false,
      image:
          AppTheme.isLight(context) ? AppImages.nfcIcon : AppImages.nfcIconDark,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            context.read<AuthBloc>().add(GetIsNfcOpenEvent());
            context.read<AuthBloc>().add(ReadFromNfcEvent());
            return AlertDialog(
              content: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is NfcReadNfc) {
                    context.read<AuthBloc>().closeNfcStatusStream();
                    AppNavigator.navigatePush(context, const PinCodeScreen());
                  }
                },
                child: SizedBox(
                  height: 0.5.sh,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        S.of(context).putNfcTag,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Lottie.asset(AppImages.nfcLoginLottie),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is NfcState) {
                            if (state.isOpen) {
                              return const SizedBox.shrink();
                            }
                          }
                          return ElevatedButton(
                            onPressed: () {
                              AppSettings.openAppSettingsPanel(
                                  AppSettingsPanelType.nfc);
                            },
                            child: Text(S.of(context).open),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ).then(
          (value) {
            context.read<AuthBloc>().closeNfcStatusStream();
          },
        );
      },
    );
    GestureDetector(
      onTap: () {},
      child: Container(
        width: 50.w,
        height: 50.w,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppTheme.isLight(context)
              ? AppColors.primaryObesty
              : AppColors.blackLight,
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
        ),
        child: Image.asset(
          AppTheme.isLight(context) ? AppImages.nfcIcon : AppImages.nfcIconDark,
        ),
      ),
    );
  }
}
