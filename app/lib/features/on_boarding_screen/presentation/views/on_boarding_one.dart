import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(color: colorApp),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: SmoothMountainPainter(),
          ),
        ),
        Positioned(
            top: context.screenHeight * 0.15,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  AppImages.onBoardingVector1,
                  height: context.screenHeight * 0.45,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: context.screenHeight * 0.015,
                ),
                SizedBox(
                    width: context.screenWidth * 0.95,
                    child: TextArabicWithStyle(
                      text: 'مع رَفِيق،',
                      textsyle: Styles.textstyle24
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: context.screenHeight * 0.015,
                ),
                SizedBox(
                    width: context.screenWidth * 0.95,
                    child: TextArabicWithStyle(
                      text:
                          ' تواصل مع أطباء متخصصين لمتابعة حالة طفلك ووضع خطط علاجية مخصصة بسهولة.',
                      textsyle: Styles.textstyle24,
                      textAlign: TextAlign.center,
                    ))
              ],
            )),
      ],
    );
  }
}

class SmoothMountainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint fillPaint = Paint()..color = Colors.white; // لون الجبل

    Path path = Path();
    path.moveTo(0, size.height * 0.7);

    path.quadraticBezierTo(size.width * 0.35, size.height * 0.5,
        size.width * 0.48, size.height * 0.45);

    path.quadraticBezierTo(size.width * 0.53, size.height * 0.4,
        size.width * 0.58, size.height * 0.45);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.55, size.width, size.height * 0.6);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
