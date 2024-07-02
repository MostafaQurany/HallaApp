// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/utils/validation.dart";


class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController control;
  final  prefixIcon;
  final bool prefixIconIsImage;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final VoidCallback? onEditingComplete;
  final VoidCallback? suffixOnTap;
  final FocusNode? focusNode;
  final FieldType fieldType;

  const CustomTextFormField({
    required this.control, required this.hintText, super.key,
    this.prefixIcon,
    this.onEditingComplete,
    this.suffixIcon,
    this.focusNode,
    this.suffixOnTap,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIconIsImage = false,
    this.fieldType = FieldType.none,
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
    widget.focusNode?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final InputDecorationTheme theme = Theme.of(context).inputDecorationTheme;
    return TextFormField(
      controller: widget.control,
      focusNode: widget.focusNode,
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: widget.obscureText,
      keyboardType: TextInputType.emailAddress,
      onEditingComplete: widget.onEditingComplete,
      decoration: InputDecoration(
        hintText: widget.hintText,
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
          onPressed: widget.suffixOnTap ??
              () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
          icon: Icon(widget.suffixIcon),
          color: !widget.obscureText ? theme.iconColor : theme.suffixIconColor,
        ),
      ),
      validator: validate,
    );
  }
 
}
