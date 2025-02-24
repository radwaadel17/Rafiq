import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: YouAre(),
  ));
}

class YouAre extends StatelessWidget {
  const YouAre({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Row(
        children: [
          TextArabicWithStyle(text: 'أنتَ تكون', textsyle: Styles.textstyle22.copyWith(fontWeight: FontWeight.normal)),
           Image.asset(AppImages.blueArrowBack),
        ],
      )
      );
  }
}
