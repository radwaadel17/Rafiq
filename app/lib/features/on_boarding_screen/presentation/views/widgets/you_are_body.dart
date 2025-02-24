import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/features/on_boarding_screen/presentation/views/widgets/custom_app_bar.dart';
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
    return  Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: const CustomAppBar(),
          ),
          const Spacer(flex: 1,),
          PhotoAndText(text: 'طبيب', textStyle:  Styles.textstyle24.copyWith(fontWeight: FontWeight.w300), image: AppImages.youAreDoctor,),
          const Spacer(flex: 2,),
          PhotoAndText(text: 'الأب أو الأم' , textStyle:  Styles.textstyle24.copyWith(fontWeight: FontWeight.w300), image: AppImages.youAreFamily,),
          const Spacer(flex: 3,),
        ],
      ),
    );
  }
}
class PhotoAndText extends StatelessWidget {
  const PhotoAndText({super.key, required this.text, required this.textStyle, required this.image});
  final String text;
  final TextStyle textStyle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * 0.02,),
          SizedBox(
            height: context.screenHeight  * 0.2,
            child: Image.asset(image)),
           SizedBox(height: context.screenHeight * 0.02,),
           TextArabicWithStyle(text: text, textsyle:textStyle),
         ],
      ),
    );
  }
}


