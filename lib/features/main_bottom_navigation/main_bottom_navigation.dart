// ignore_for_file: deprecated_member_use

import 'package:app/core/utlis/constants.dart';
import 'package:app/features/chat%20bot/presentation/views/widgets/chat_bot.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainBottomNavigation extends StatefulWidget {
  final Widget child;

  const MainBottomNavigation({super.key, required this.child});

  @override
  State<MainBottomNavigation> createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/doctors');
        break;
      case 2:
        context.go('/questions');
        break;
      // case 3:
      //   context.go('/calendar');
      //   break;
    }
  }

  int _calculateSelectedIndex(String location) {
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/doctors')) return 1;
    if (location.startsWith('/questions')) return 2;
    // if (location.startsWith('/calendar')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location =
        GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
    final selectedIndex = _calculateSelectedIndex(location);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: widget.child,
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: ModalRoute.of(context)!.animation!,
                    curve: Curves.easeIn,
                  ),
                ),
                child: const ChatBot(),
              );
            },
          );
        },
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
            _navItem(Assets.icons.doctors, selectedIndex == 1),
            const BottomNavigationBarItem(icon: SizedBox(), label: ''),
            _navItem(Assets.icons.questions, selectedIndex == 2),
            _navItem(Assets.icons.calendar, selectedIndex == 3),
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
