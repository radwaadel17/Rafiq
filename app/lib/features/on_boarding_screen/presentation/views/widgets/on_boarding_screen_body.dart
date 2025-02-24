import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: YouAreBody(),
  ));
}

class YouAreBody extends StatelessWidget {
  const YouAreBody({super.key});

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
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Row(
          children: [
            const Spacer(flex: 3,),
            TextArabicWithStyle(text: 'أنتَ تكون', textsyle: Styles.textstyle22.copyWith(fontWeight: FontWeight.normal)),
            const Spacer(flex: 2,),
             SizedBox(
              height: 12.h,
              child: Image.asset(AppImages.blueArrowBack)),
             const  Spacer(flex: 1,),
          ],
        ),
      )
      );
  }
}
