import "package:app_settings/app_settings.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/app_show_dialog.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/features/auth/presentation/blocs/nfc%20cubit/nfc_cubit.dart";
import "package:halla/features/auth/presentation/screens/log%20in/pin_code_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/social_icon.dart";
import "package:halla/generated/l10n.dart";
import "package:lottie/lottie.dart";

class NfcButton extends StatefulWidget {
  const NfcButton({super.key});

  @override
  State<NfcButton> createState() => _NfcButtonState();
}

class _NfcButtonState extends State<NfcButton> {
  bool isOpen = false;
  bool isReading = false;

  bool lastState = false;

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
            context.read<NfcCubit>().getIsNfcOpenEvent();
            context.read<NfcCubit>().readFromNfc();
            return BlocConsumer<NfcCubit, NfcState>(
              listener: (context, state) {
                state.whenOrNull(
                  nfcLoading: () => AppShowDialog.loading(context),
                  nfcState: (isOpen) => this.isOpen = isOpen,
                  nfcError: (error) => AppShowDialog.error(context, error),
                  nfcReadNfc: (nfcMessage) =>
                      AppNavigator.navigatePush(context, PinCodeScreen()),
                );
              },
              builder: (context, state) {
                if (lastState != isOpen) {
                  lastState = isOpen;
                  if (isOpen) {
                    context.read<NfcCubit>().readFromNfc();
                  }
                }
                return AlertDialog(
                  content: SizedBox(
                    height: 0.5.sh,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          S.of(context).putNfcTag,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Lottie.asset(AppImages.nfcLoginLottie),
                        (isOpen)
                            ? const SizedBox.shrink()
                            : ElevatedButton(
                                onPressed: () {
                                  AppSettings.openAppSettingsPanel(
                                      AppSettingsPanelType.nfc);
                                },
                                child: Text(S.of(context).open),
                              )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ).then(
          (value) {
            context.read<NfcCubit>().closeNfcStatusStream();
          },
        );
      },
    );
  }
}
