import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/utils/app_show_dialog.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/nfc_write_screen.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/personal_information_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/pin_code_text_form_field.dart";
import "package:halla/features/home/presentation/screens/home_layout.dart";
import "package:halla/generated/l10n.dart";

class SmsCodeBody extends StatefulWidget {
  final String phoneNumber;
  const SmsCodeBody({required this.phoneNumber, super.key});

  @override
  State<SmsCodeBody> createState() => _SmsCodeBodyState();
}

class _SmsCodeBodyState extends State<SmsCodeBody> {
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
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          AppShowDialog.loading(context);
        } else if (state is AuthFailure) {
          Navigator.pop(context);
          AppShowDialog.showErrorMessage(context, state.message);
        } else if (state is AuthSuccess) {
          if (context.read<AuthBloc>().isLogWithPhone) {
            context.read<AuthBloc>().isLogWithPhone = false;
            AppNavigator.navigatePushReplaceRemoveAll(
              context,
              const HomeLayout(),
            );
          } else {
            state.user.primePhone = widget.phoneNumber;
            context.read<AuthBloc>().add(
                  AuthUploadUserEvent(
                    user: state.user,
                  ),
                );
          }
        } else if (state is AuthUploadSuccess) {
          if (context.read<AuthBloc>().isSignWithSocial) {
            context.read<AuthBloc>().isSignWithSocial = false;
            AppNavigator.navigatePushReplaceRemoveAll(
              context,
              const HomeLayout(),
            );
          } else {
            context.read<AuthBloc>().add(
                  GetIsNfcAvailableEvent(),
                );
          }
        } else if (state is GetIsNfcAvailableState) {
          if (state.isAvailable) {
            AppNavigator.navigatePushReplaceRemoveAll(
              context,
              const NfcWriteScreen(),
            );
          } else {
            AppNavigator.navigatePushReplaceRemoveAll(
              context,
              const PersonalInformationScreen(),
            );
          }
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              S.of(context).pleaseEnterVerificationCodeNsentToYourPhoneNumber,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                      context.read<AuthBloc>().add(
                            AuthGetSmsCodeEvent(
                              phoneNumber: widget.phoneNumber,
                            ),
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                  if (context.read<AuthBloc>().isLogWithPhone) {
                    context.read<AuthBloc>().add(
                          AuthLogWithPhoneEvent(
                            smsCode: pinController.text.trim(),
                          ),
                        );
                  } else {
                    context.read<AuthBloc>().add(
                          AuthSentSmsCodeEvent(
                            smsCode: pinController.text.trim(),
                          ),
                        );
                  }
                }
              },
              child: Text(S.of(context).verified),
            ),
          ],
        );
      },
    );
  }
}
