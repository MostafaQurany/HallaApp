import 'package:flutter/material.dart';
import 'package:halla/core/utils/validation.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart';

class CustomPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final bool isFirst;
  final bool isAdd;
  final void Function()? suffixOnTap;
  const CustomPhoneField({
    super.key,
    required this.controller,
    required this.isFirst,
    required this.isAdd,
    this.suffixOnTap,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      control: widget.controller,
      hintText: "phone",
      keyboardType: TextInputType.phone,
      fieldType: FieldType.phone,
      prefixIcon: Icons.phone_outlined,
      suffixIcon: widget.isFirst
          ? widget.isAdd
              ? Icons.add
              : null
          : widget.isAdd
              ? Icons.add
              : Icons.remove,
      suffixOnTap: widget.suffixOnTap,
    );
  }
}
