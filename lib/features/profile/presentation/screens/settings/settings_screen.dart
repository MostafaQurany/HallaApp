import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/widgets/arrow_back.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/profile/presentation/screens/settings/widgets/dark_theme_setting_body.dart';
import 'package:halla/features/profile/presentation/screens/settings/widgets/language_setting_body.dart';
import 'package:halla/features/profile/presentation/screens/settings/widgets/settings_language_changes.dart';
import 'package:halla/features/splash/presentation/bloc/brightness%20cubit/brightness_cubit.dart';
import 'package:halla/features/splash/presentation/bloc/language%20cubit/language_cubit.dart';
import 'package:halla/generated/l10n.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const ArrowBack()),
      body: Padding(
        padding: AppConstants.paddingScreen,
        child: const Column(
          children: [
            DarkThemeSettingBody(),
            LanguageSettingBody(),
          ],
        ),
      ),
    );
  }
}
