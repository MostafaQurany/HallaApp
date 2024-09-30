import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/profile/presentation/screens/settings/widgets/language_setting_body.dart';
import 'package:halla/features/profile/presentation/screens/settings/widgets/settings_language_changes.dart';
import 'package:halla/features/splash/presentation/bloc/brightness%20cubit/brightness_cubit.dart';
import 'package:halla/features/splash/presentation/bloc/language%20cubit/language_cubit.dart';
import 'package:halla/generated/l10n.dart';

class DarkThemeSettingBody extends StatefulWidget {
  const DarkThemeSettingBody({super.key});

  @override
  State<DarkThemeSettingBody> createState() => _DarkThemeSettingBodyState();
}

class _DarkThemeSettingBodyState extends State<DarkThemeSettingBody> {
  late bool _isDark;
  @override
  Widget build(context) {
    _isDark = !AppTheme.isLight(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).theme,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.isLight(context)
                ? AppColors.white
                : AppColors.blackLight,
            borderRadius: BorderRadius.circular(8),
            boxShadow: AppTheme.isLight(context)
                ? [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.3),
                      blurRadius: BorderSide.strokeAlignOutside,
                      blurStyle: BlurStyle.inner,
                      offset: const Offset(0, 1),
                      spreadRadius: 1,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: AppColors.grayLight.withOpacity(0.6),
                      blurRadius: BorderSide.strokeAlignOutside,
                      blurStyle: BlurStyle.inner,
                      offset: const Offset(0, 1),
                      spreadRadius: 1,
                    ),
                  ],
          ),
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          margin: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: Row(
            children: [
              Text(
                S.of(context).darkTheme,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppTheme.isLight(context)
                          ? AppColors.grayDark
                          : AppColors.grayLight,
                    ),
              ),
              const Spacer(),
              const Icon(Icons.light_mode),
              Switch(
                value: _isDark,
                onChanged: (value) {
                  context
                      .read<BrightnessCubit>()
                      .updateTheme(!value ? ThemeMode.light : ThemeMode.dark);
                },
              ),
              const Icon(Icons.dark_mode),
            ],
          ),
        ),
      ],
    );
  }
}
