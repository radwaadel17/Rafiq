import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/spalsh_screen/presentation/views/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';

class SpalshScreenBody extends StatelessWidget {
  const SpalshScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 48,
                  child: Image(image: AssetImage(AppImages.photoLogo1))),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                  height: 48,
                  child: Image(image: AssetImage(AppImages.photoLogo2))),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 48,
                  child: Image(image: AssetImage(AppImages.photoLogo3))),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                  height: 48,
                  child: Image(image: AssetImage(AppImages.photoLogo4))),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 15,
          ),
          TextArabicWithStyle(
            text: 'أهلاً، أنا رَفيق',
            textsyle: Styles.textstyle24.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: context.screenWidth * 0.9,
            child: const TextArabicWithStyle(
              text:
                  'مساعدك الأمثل لدعم الأطفال ذوي التوحد، يقربك من الأطباء، يوفر لك مجتمعًا للآباء، ويقدم حلولًا مبتكرة لتعليم طفلك',
              textsyle: Styles.textstyle24,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
