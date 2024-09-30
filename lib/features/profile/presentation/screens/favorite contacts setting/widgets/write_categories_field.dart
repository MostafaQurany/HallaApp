import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/utils/validation.dart';
import 'package:halla/features/auth/presentation/screens/widgets/custem_text_form_field.dart';
import 'package:halla/features/profile/presentation/blocs/bloc/profile_bloc.dart';
import 'package:halla/generated/l10n.dart';

class WriteCategoriesField extends StatefulWidget {
  const WriteCategoriesField({super.key});

  @override
  State<WriteCategoriesField> createState() => _WriteCategoriesFieldState();
}

class _WriteCategoriesFieldState extends State<WriteCategoriesField> {
  final TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            AppImages.addCategorieLottie,
            repeat: false,
            width: 120.w,
          ),
          Expanded(
            child: Text(S.of(context).addNewCategories),
          ),
        ],
      ),
      titleTextStyle: AppTheme.getThemeText(context).headlineSmall!.copyWith(
            fontSize: 20.sp,
          ),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(S.of(context).typeYourNewFavoriteCategorieToAdd),
            SizedBox(
              height: 15.h,
            ),
            CustomTextFormField(
              control: controller,
              fieldType: FieldType.category,
              hintText: S.of(context).categorie,
              prefixIcon: Icons.contacts_outlined,
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        SizedBox(
          width: 100.w,
          child: ElevatedButton(
            child: Text(S.of(context).add),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Map<int, String> map =
                    UserCubit.get(context).user!.favoriteCategories;
                int maxKey = 0;
                if (map.isEmpty) {
                  maxKey = -1;
                } else {
                  maxKey = map.keys.reduce((a, b) => a > b ? a : b);
                }
                map[maxKey + 1] = controller.text;
                UserCubit.get(context).user!.favoriteCategories = map;
                context.read<ProfileBloc>().add(
                      UpdateUserEvent(user: UserCubit.get(context).user!),
                    );
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        TextButton(
          child: Text(S.of(context).cancel,
              style: AppTheme.getThemeText(context).bodyMedium!.copyWith(
                    color: AppColors.gray,
                  )),
          onPressed: () {
            controller.dispose();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
