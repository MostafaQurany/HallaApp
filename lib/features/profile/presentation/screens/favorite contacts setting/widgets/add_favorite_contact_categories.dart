import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/features/profile/presentation/screens/favorite%20contacts%20setting/widgets/favorite_container_decoration.dart';
import 'package:halla/features/profile/presentation/screens/favorite%20contacts%20setting/widgets/write_categories_field.dart';

class AddFavoriteContactCategories extends StatelessWidget {
  const AddFavoriteContactCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return FavoriteContainerDecoration(
      widget: InkWell(
        onTap: () {
          AppShowDialog.scaleAlertDialog(context, const WriteCategoriesField());
        },
        child: Row(
          children: [
            Text(
              "Add Categories",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppTheme.isLight(context)
                        ? AppColors.grayDark
                        : AppColors.grayLight,
                  ),
            ),
            const Spacer(),
            Icon(
              Icons.add,
              color: AppColors.primary,
              size: 26.sp,
            ),
          ],
        ),
      ),
    );
  }
}
