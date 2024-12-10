import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:halla/features/home/presentation/screens/home_screen.dart';
import 'package:halla/features/profile/presentation/screens/profile_screen.dart';
import 'package:halla/generated/l10n.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late PageController _pageController;

  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const ContactsScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: _screens,
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: false,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        backgroundColor:
            AppTheme.isLight(context) ? AppColors.white : AppColors.blackLight,
        onItemSelected: (index) => setState(
          () {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 150),
              curve: Curves.easeInOutCirc,
            );
          },
        ),
        items: [
          BottomNavyBarItem(
            icon: ImageIcon(
              AssetImage(
                AppImages.homeBNBIcon,
              ),
              size: 23.sp,
            ),
            title: Text(S.of(context).home),
            activeColor: AppColors.primary,
            inactiveColor: AppColors.grayLight,
          ),
          BottomNavyBarItem(
            icon: ImageIcon(
              AssetImage(
                AppImages.contactBNBIcon,
              ),
              size: 23.sp,
            ),
            title: Text(S.of(context).contact),
            activeColor: AppColors.primary,
            inactiveColor: AppColors.grayLight,
          ),
          BottomNavyBarItem(
            icon: ImageIcon(
              AssetImage(
                AppImages.profileBNBIcon,
              ),
              size: 23.sp,
            ),
            title: Text(
              S.of(context).profile,
            ),
            activeColor: AppColors.primary,
            inactiveColor: AppColors.grayLight,
          ),
        ],
      ),
    );
  }
}
