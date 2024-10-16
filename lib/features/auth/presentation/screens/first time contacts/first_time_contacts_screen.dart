import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart';
import 'package:halla/features/auth/presentation/screens/first%20time%20contacts/widgets/first_time_contacts_body.dart';
import 'package:halla/features/auth/presentation/screens/first%20time%20contacts/widgets/search_first_time_contact_screen.dart';
import 'package:halla/features/home/presentation/screens/home_layout.dart';
import 'package:halla/generated/l10n.dart';

class FirstTimeContactsScreen extends StatefulWidget {
  const FirstTimeContactsScreen({super.key});

  @override
  State<FirstTimeContactsScreen> createState() =>
      _FirstTimeContactsScreenState();
}

class _FirstTimeContactsScreenState extends State<FirstTimeContactsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthGetNativeLocalContact());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppConstants.paddingScreen,
              child: Column(
                children: [
                  // title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 0.3.sw,
                      ),
                      Text(
                        "Contact",
                        style: AppTheme.getThemeText(context).headlineMedium,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          AppNavigator.navigatePush(
                            context,
                            const HomeLayout(),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(
                            bottom: 3.h,
                          ),
                          child: Text(
                            S.of(context).skip,
                            style: AppTheme.getThemeText(context)
                                .bodySmall!
                                .copyWith(
                                  color: AppColors.primary,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // search par
                  SizedBox(
                    height: 30.h,
                  ),
                  const SearchFirstTimeContactScreen(),
                ],
              ),
            ),
            // body
            const FirstTimeContactsBody()
          ],
        ),
      ),
    );
  }
}
