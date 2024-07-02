import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/personal_information_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/pin_code_text_form_field.dart";
import "package:halla/generated/l10n.dart";

class PinCodeBody extends StatefulWidget {
  const PinCodeBody({super.key});

  @override
  State<PinCodeBody> createState() => _PinCodeBodyState();
}

class _PinCodeBodyState extends State<PinCodeBody> {
  final TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static const int maxSeconds = 60; // Set the countdown duration in seconds
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
  Widget build(BuildContext context) => Column(
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
          "01149075894",
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
                  resetTimer();
                }
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: AppColors.gray,
                  ),
                ),),
                child: Text(
                  S.of(context).resendCode,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: seconds == 0 ? AppColors.primary : AppColors.gray,),
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
            // TODO : make the validator of the sms
            navigatePushReplaceRemoveAll(
                context, const PersonalInformationScreen(),);
          },
          child: Text(S.of(context).verified),
        ),
      ],
    );
 }
