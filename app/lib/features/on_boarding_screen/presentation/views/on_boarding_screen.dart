import 'package:app/features/on_boarding_screen/presentation/views/widgets/on_boarding_three.dart';
import 'package:app/features/on_boarding_screen/presentation/views/widgets/on_boarding_two.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  OnBoardingThree()
    );
  }
}