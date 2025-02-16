// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";
import "package:halla/generated/l10n.dart";
import "package:pinput/pinput.dart";

import "package:halla/core/theme/app_colors.dart";

class CustomPinCodeField extends StatefulWidget {
  final TextEditingController pinController;
  final String? Function(String?)? validator;
  const CustomPinCodeField({
    required this.pinController,
    this.validator,
    super.key,
  });

  @override
  State<CustomPinCodeField> createState() => _CustomPinCodeFieldState();
}

class _CustomPinCodeFieldState extends State<CustomPinCodeField> {
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    widget.pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color focusedBorderColor = AppColors.primary;
    const Color fillColor = Color.fromRGBO(243, 246, 249, 0);
    final Color borderColor = AppColors.gray;

    final PinTheme defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color: AppColors.primary,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: widget.pinController,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        length: 6,
        separatorBuilder: (int index) => const SizedBox(width: 8),
        validator: widget.validator ??
            (String? value) =>
                value?.length == 6 ? null : S.of(context).pinIsIncorrect,
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: (String pin) {
          debugPrint("onCompleted: $pin");
        },
        onChanged: (String value) {
          debugPrint("onChanged: $value");
        },
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: focusedBorderColor,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: fillColor,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: Colors.redAccent),
        ),
      ),
    );
  }
}
