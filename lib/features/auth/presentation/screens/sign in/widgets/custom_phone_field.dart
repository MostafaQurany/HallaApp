import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/utils/validation.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart';

class CustomPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final bool isFirst;
  final bool isAdd;
  final bool? ignorePointers;
  final void Function()? suffixOnTap;
  final FocusNode? focusNode;
  const CustomPhoneField({
    super.key,
    required this.controller,
    required this.isFirst,
    required this.isAdd,
    this.suffixOnTap,
    this.ignorePointers,
     this.focusNode,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 960.w,
      child: Row(
        children: [
          SizedBox(
            width: 312.w,
            child: CustomTextFormField(
              control: widget.controller,
              focusNode: widget.focusNode,
              hintText: "phone",
              keyboardType: TextInputType.phone,
              fieldType: FieldType.phone,
              prefixIcon: Icons.phone_outlined,
              ignorePointers: widget.ignorePointers,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          InkWell(
            onTap: widget.suffixOnTap,
            child: Icon(
              widget.isFirst
                  ? widget.isAdd
                      ? Icons.add
                      : null
                  : widget.isAdd
                      ? Icons.add
                      : Icons.remove,
            ),
          )
        ],
      ),
    );
  }
}
