import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/generated/l10n.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Text(
          S.of(context).or,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.gray,
              ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}


