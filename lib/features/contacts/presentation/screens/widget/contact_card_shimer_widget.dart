import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ContactCardShimmer extends StatelessWidget {
  final Color _baseColor = AppColors.primary;
  final Color _highlightColor = AppColors.primary.withOpacity(0.7);

  ContactCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Theme.of(context).inputDecorationTheme.fillColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Shimmer.fromColors(
                    baseColor: _baseColor,
                    highlightColor: _highlightColor,
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Shimmer.fromColors(
                    baseColor: _baseColor,
                    highlightColor: _highlightColor,
                    child: Container(
                      width: 145.w,
                      height: 16.h,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
