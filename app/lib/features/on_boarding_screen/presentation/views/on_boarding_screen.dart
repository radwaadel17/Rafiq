import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/on_boarding_screen/presentation/views/widgets/on_boarding_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const OnBoardingOne(),
          Positioned(
              bottom: 15.h,
              left: 24.w,
              right: 24.w,
              child: const SizedBox(child: CustomButton(text: 'التالي'))),
          Positioned(
              top: 30.h,
              right: 24.w,
              child: Row(
                children: [
                  Container(
                    height: 42,
                    width: 74,
                    decoration: BoxDecoration(
                        color: colorApp,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'تخطي',
                        style: Styles.textstyle18.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
