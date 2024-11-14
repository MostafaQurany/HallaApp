import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/app_show_dialog.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/features/auth/presentation/blocs/login%20cubit/login_cubit.dart";
import "package:halla/features/auth/presentation/blocs/nfc%20cubit/nfc_cubit.dart";
import "package:halla/features/auth/presentation/blocs/sign%20cubit/sign_in_cubit.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/nfc_write_screen.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/personal_information_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/pin_code_text_form_field.dart";
import "package:halla/generated/l10n.dart";

class SmsCodeScreen extends StatefulWidget {
  final String phoneNumber;
  final String? verificationId;

  const SmsCodeScreen({
    required this.phoneNumber,
    this.verificationId,
    super.key,
  });

  @override
  State<SmsCodeScreen> createState() => _SmsCodeScreenState();
}

class _SmsCodeScreenState extends State<SmsCodeScreen> {
  final TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static const int maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      seconds = maxSeconds;
    });
    timer?.cancel();
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => startTimer(),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          title: Text(
            S.of(context).verificationCode,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: 1.sh,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.1),
                      blurRadius: 1.sh,
                    ),
                  ],
                ),
                child: Image.asset(
                  AppTheme.isLight(context)
                      ? AppImages.loginSignBackgroundLight
                      : AppImages.loginSignBackgroundDark,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: Image.asset(
                        AppImages.pinCodeVector,
                        height: 100.h,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    BlocListener<NfcCubit, NfcState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          nfcAvailable: (isAvailable) {
                            if (isAvailable == true) {
                              AppNavigator.navigatePushReplace(
                                  context, NfcWriteScreen());
                            } else {
                              AppNavigator.navigatePushReplace(
                                  context, PersonalInformationScreen());
                            }
                          },
                        );
                      },
                      child: BlocListener<SignInCubit, SignInState>(
                        listener: (context, state) {
                          state.whenOrNull(
                            loadingOtp: () => AppShowDialog.loading(context),
                            errorOtp: (String error) {
                              AppShowDialog.error(context, error);
                            },
                            successOtp: () =>
                                context.read<SignInCubit>().authLinkWithEmail(),
                            uploadUserSuccess: () => context
                                .read<NfcCubit>()
                                .getIsNfcAvailableEvent(),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              S
                                  .of(context)
                                  .pleaseEnterVerificationCodeNsentToYourPhoneNumber,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.gray,
                                  ),
                              maxLines: 3,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              widget.phoneNumber,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            Form(
                              key: formKey,
                              child: CustomPinCodeField(
                                pinController: pinController,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    if (seconds == 0) {
                                      Future.delayed(
                                        const Duration(
                                          seconds: 1,
                                        ),
                                      ).then(
                                        (value) => resetTimer(),
                                      );
                                      SignInCubit.get(context).authGetSmsCode(
                                        phoneNumber: widget.phoneNumber,
                                      );
                                    }
                                  },
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: AppColors.gray,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      S.of(context).resendCode,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: seconds == 0
                                                ? AppColors.primary
                                                : AppColors.gray,
                                          ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "$seconds s",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: AppColors.primary),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (widget.verificationId != null) {
                                    context.read<LoginCubit>().loginGetOtp(
                                          verificationId:
                                              widget.verificationId ?? '',
                                          smsCode: pinController.text.trim(),
                                        );
                                  } else {
                                    context.read<SignInCubit>().authSentSmsCode(
                                          pinController.text.trim(),
                                        );
                                  }
                                }
                              },
                              child: Text(S.of(context).verified),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
