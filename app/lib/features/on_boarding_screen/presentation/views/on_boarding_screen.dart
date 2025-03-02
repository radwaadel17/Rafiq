import 'package:app/features/on_boarding_screen/presentation/views/on_boarding_one.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  OnBoardingOne(),
    );
  }
}