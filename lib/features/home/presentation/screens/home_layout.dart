import 'package:flutter/material.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:halla/features/home/presentation/screens/home_screen.dart';

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
    const HomeScreen(),
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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primary,
          backgroundColor: AppColors.blackLight,
          elevation: 0,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return ImageIcon(
                    AssetImage(AppImages.homeBNBIcon),
                    size: _selectedIndex == 0 ? _animation.value : 20,
                  );
                },
              ),
              label: _selectedIndex == 0 ? '' : 'Home',
            ),
            BottomNavigationBarItem(
              icon: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return ImageIcon(
                    AssetImage(AppImages.contactBNBIcon),
                    size: _selectedIndex == 1 ? _animation.value : 20,
                  );
                },
              ),
              label: _selectedIndex == 1 ? '' : 'Contact',
            ),
            BottomNavigationBarItem(
              icon: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return ImageIcon(
                    AssetImage(AppImages.profileBNBIcon),
                    size: _selectedIndex == 2 ? _animation.value : 20,
                  );
                },
              ),
              label: _selectedIndex == 2 ? '' : 'Profile',
            ),
          ],
        ),
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
}
