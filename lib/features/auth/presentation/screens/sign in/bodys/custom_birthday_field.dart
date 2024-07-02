import 'package:flutter/material.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart';

class BirthdayPickerTextField extends StatefulWidget {
  final TextEditingController controller;

  const BirthdayPickerTextField({super.key, required this.controller});

  @override
  _BirthdayPickerTextFieldState createState() =>
      _BirthdayPickerTextFieldState();
}

class _BirthdayPickerTextFieldState extends State<BirthdayPickerTextField> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        widget.controller.text =
            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: IgnorePointer(
        child: CustomTextFormField(
          control: widget.controller,
          hintText: "Data Of Birth",
          prefixIcon: Icons.calendar_today_outlined,
        ),
      ),
    );
  }
}
