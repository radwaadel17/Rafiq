// ignore_for_file: deprecated_member_use

import 'package:app/core/utlis/constants.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DoctorBottomNavigation extends StatefulWidget {
  final Widget child;

  const DoctorBottomNavigation({super.key, required this.child});

  @override
  State<DoctorBottomNavigation> createState() => _DoctorBottomNavigationState();
}

class _DoctorBottomNavigationState extends State<DoctorBottomNavigation> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.go('/doctorHome');
        break;
      case 1:
        context.go('/appointments');
        break;
      case 2:
        context.go('/conversations');
        break;
      case 3:
        context.go('/doctorProfile');
        break;
    }
  }

  int _calculateSelectedIndex(String location) {
    if (location.startsWith('/doctorHome')) return 0;
    if (location.startsWith('/appointments')) return 1;
    if (location.startsWith('/conversations')) return 2;
    if (location.startsWith('/doctorProfile')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
    final selectedIndex = _calculateSelectedIndex(location);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: widget.child,
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(top: 75),
          child: Container(
            height: 58,
            width: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorApp.withOpacity(0.83),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(Assets.icons.aiChat),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          currentIndex: selectedIndex >= 2 ? selectedIndex + 1 : selectedIndex,
          onTap: (int index) {
            if (index == 2) return;
            int actualIndex = index > 2 ? index - 1 : index;
            _onItemTapped(actualIndex);
          },
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            _navItem(Assets.icons.home, selectedIndex == 0),
            _navItem(Assets.icons.appointments, selectedIndex == 1),
            const BottomNavigationBarItem(icon: SizedBox(), label: ''),
            _navItem(Assets.icons.chat, selectedIndex == 2),
            _navItem(Assets.icons.profile, selectedIndex == 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(String iconPath, bool isSelected) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: SvgPicture.asset(
          iconPath,
          color: isSelected ? colorApp : Colors.black,
        ),
      ),
      label: '',
    );
  }
}
