import 'package:flutter/material.dart';
import 'package:halla/core/common/presentation/widgets/arrow_back.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/features/profile/presentation/screens/settings/widgets/dark_theme_setting_body.dart';
import 'package:halla/features/profile/presentation/screens/settings/widgets/language_setting_body.dart';

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
