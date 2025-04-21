import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.white),
              ),
              Positioned.fill(
                child: CustomPaint(
                  painter: InvertedMountainPainter(),
                ),
              ),
              Positioned(
                  top: context.screenHeight * 0.20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      SizedBox(
                          width: context.screenWidth * 0.95,
                          child: TextArabicWithStyle(
                            text:
                                'شارك تجربتك وتواصل مع آباء آخرين عبر رَفِيق للحصول على دعم وحلول عملية.',
                            textsyle: context.screenHeight < 700
                                ? Styles.textstyle24.copyWith(fontSize: 20.sp)
                                : Styles.textstyle24,
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        height: context.screenHeight * 0.040,
                      ),
                      Image.asset(
                        AppImages.onBoardingVector2,
                        height: context.screenHeight * 0.45,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.015,
                      ),
                    ],
                  )),
            ],
          ),
          Positioned(
              bottom: 15.h,
              left: 24.w,
              right: 24.w,
              child: SizedBox(
                  child: CustomButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .pushReplacement(Approuter.onBoardingThree);
                      },
                      text: 'التالي'))),
          Positioned(
              top: 50.h,
              right: 24.w,
              left: 24.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 12.h,
                      child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(-1.0, 1.0),
                          child: GestureDetector(
                              onTap: () {
                                GoRouter.of(context)
                                    .pushReplacement(Approuter.onBoardingOne);
                              },
                              child: Image.asset(AppImages.blueArrowBack)))),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(Approuter.onBoardingThree);
                    },
                    child: Container(
                      height: 42,
                      width: 74,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: colorApp),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'تخطي',
                          style: Styles.textstyle18.copyWith(color: colorApp),
                        ),
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

class InvertedMountainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint fillPaint = Paint()
      ..color = const Color(0xff49B04D); // لون الجبل الأخضر

    Path path = Path();
    path.moveTo(
        0, size.height * 0.5); // بداية الشكل من اليسار ولكن أقل ارتفاعًا

    path.quadraticBezierTo(size.width * 0.35, size.height * 0.65,
        size.width * 0.48, size.height * 0.7);

    path.quadraticBezierTo(size.width * 0.53, size.height * 0.75,
        size.width * 0.58, size.height * 0.7);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.6, size.width, size.height * 0.55);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, fillPaint); // رسم الجبل الأخضر
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
