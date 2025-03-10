import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';

class ProfileWorkLocationRange extends StatefulWidget {
  const ProfileWorkLocationRange({Key? key}) : super(key: key);

  @override
  State<ProfileWorkLocationRange> createState() =>
      ProfileWorkLocationRangeState();
}

class ProfileWorkLocationRangeState extends State<ProfileWorkLocationRange> {
  int value = 0;

  String _label = '0 kms';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80.w,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Theme.of(context).inputDecorationTheme.fillColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text(_label)),
        ),
        Expanded(
          flex: 8,
          child: Slider(
            min: 0,
            max: 200,
            divisions: 4,
            value: value.toDouble(),
            label: _label,
            activeColor: AppColors.primary,
            inactiveColor: AppColors.primary.withOpacity(0.2),
            onChanged: (double value) {
              setState(() {
                this.value = value.toInt();
                _label = '${value.toInt().toString()} kms';
              });
            },
          ),
        ),
      ],
    );
  }
}
