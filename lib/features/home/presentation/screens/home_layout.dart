import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:halla/features/home/presentation/screens/home_screen.dart';
import 'package:halla/features/profile/presentation/screens/profile_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const ContactsScreen(),
    const ProfileScreen(),
  ];

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 20, end: 30).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _screens[_selectedIndex],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                color: AppTheme.isLight(context)
                    ? AppColors.white
                    : AppColors.blackLight,
              ),
              width: 1.sw,
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _bottomNavigationItem(
                    icon: AppImages.homeBNBIcon,
                    name: 'Home',
                    index: 0,
                  ),
                  _bottomNavigationItem(
                    icon: AppImages.contactBNBIcon,
                    name: 'Contact',
                    index: 1,
                  ),
                  _bottomNavigationItem(
                    icon: AppImages.profileBNBIcon,
                    name: 'Profile',
                    index: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == index) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  _bottomNavigationItem({
    required String icon,
    required String name,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return ImageIcon(
                AssetImage(icon),
                color: _selectedIndex == index ? AppColors.primary : null,
                size: _selectedIndex == index ? _animation.value : 20,
              );
            },
          ),
          if (_selectedIndex == index)
            Text(
              name,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: _selectedIndex == index
                      ? AppColors.primary
                      : AppColors.black),
            ),
        ],
      ),
    );
  }
}
