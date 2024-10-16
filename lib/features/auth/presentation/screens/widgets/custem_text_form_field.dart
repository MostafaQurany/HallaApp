// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/utils/validation.dart";

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController control;
  final dynamic prefixIcon;
  final bool prefixIconIsImage;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final VoidCallback? onEditingComplete;
  final VoidCallback? suffixOnTap;
  final FocusNode? focusNode;
  final FieldType fieldType;
  final String confirmPassword;
  final bool? ignorePointers;
  final void Function(String)? onChanged;
  final String? Function(String?)? validate;

  const CustomTextFormField({
    required this.control,
    required this.hintText,
    super.key,
    this.prefixIcon,
    this.ignorePointers,
    this.onEditingComplete,
    this.suffixIcon,
    this.focusNode,
    this.suffixOnTap,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIconIsImage = false,
    this.fieldType = FieldType.none,
    this.confirmPassword = '',
    this.onChanged,
    this.validate,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;

  String? validate(String? value) {
    switch (widget.fieldType) {
      case FieldType.email:
        return MyValidation.emailValidator(value);
      case FieldType.name:
        return MyValidation.nameValidator(value);
      case FieldType.password:
        return MyValidation.passwordValidator(value);
      case FieldType.text:
        return MyValidation.textValidator(value);
      case FieldType.category:
        return MyValidation.categoryValidator(value);
      case FieldType.phone:
        return MyValidation.phoneNumberValidator(value);
      case FieldType.confPasword:
        return MyValidation.confirmPasswordValidate(
            value, widget.confirmPassword);
      case FieldType.none:
        return null;
    }
  }

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final InputDecorationTheme theme = Theme.of(context).inputDecorationTheme;
    return TextFormField(
      controller: widget.control,
      focusNode: widget.focusNode,
      ignorePointers: widget.ignorePointers,
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: obscureText,
      keyboardType: widget.keyboardType,
      onEditingComplete: widget.onEditingComplete,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: theme.fillColor,
        prefixIcon: widget.prefixIconIsImage
            ? Container(
                padding: EdgeInsets.all(10.0.w),
                child: ImageIcon(
                  AssetImage(widget.prefixIcon!),
                  color: theme.prefixIconColor,
                ),
              )
            : Icon(
                widget.prefixIcon,
                color: theme.prefixIconColor,
              ),
        suffixIcon: IconButton(
          onPressed: widget.suffixIcon == Icons.remove_red_eye_outlined
              ? () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                }
              : widget.suffixOnTap,
          icon: Icon(
            widget.suffixIcon == Icons.remove_red_eye_outlined
                ? obscureText
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye
                : widget.suffixIcon,
          ),
          color: !widget.obscureText ? theme.iconColor : theme.suffixIconColor,
        ),
      ),
      validator: widget.validate ?? validate,
      onChanged: widget.onChanged,
    );
  }
}
