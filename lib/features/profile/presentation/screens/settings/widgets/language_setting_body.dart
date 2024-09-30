import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/features/profile/presentation/screens/settings/widgets/settings_language_changes.dart';
import 'package:halla/features/splash/presentation/bloc/language%20cubit/language_cubit.dart';
import 'package:halla/generated/l10n.dart';

class LanguageSettingBody extends StatefulWidget {
  const LanguageSettingBody({super.key});

  @override
  State<LanguageSettingBody> createState() => _LanguageSettingBodyState();
}

class _LanguageSettingBodyState extends State<LanguageSettingBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).language,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SettingsLanguageChanges(
          icon: AppImages.arabicLanguageIcon,
          name: S.of(context).arabic,
          isSelected:
              context.read<LanguageCubit>().state.languageCode.contains('ar'),
          onTap: context.read<LanguageCubit>().state.languageCode.contains('ar')
              ? null
              : () {
                  context
                      .read<LanguageCubit>()
                      .updateLanguage(const Locale('ar'));
                },
        ),
        SettingsLanguageChanges(
          icon: AppImages.englishLanguageIcon,
          name: S.of(context).english,
          isSelected:
              context.read<LanguageCubit>().state.languageCode.contains('en'),
          onTap: context.read<LanguageCubit>().state.languageCode.contains('en')
              ? null
              : () {
                  context
                      .read<LanguageCubit>()
                      .updateLanguage(const Locale('en'));
                },
        ),
      ],
    );
  }
}
