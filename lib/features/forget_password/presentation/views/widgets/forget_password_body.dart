import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/Label_and_text_field_widget.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(child: 
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 24.w , vertical: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 12.h,
                    child: GestureDetector
                    (
                      onTap: (){
                        GoRouter.of(context).pop();
                      },
                      child: Image.asset(AppImages.blueArrowBack)))
                ],
              ),
            )
            ) ,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.screenHeight * 0.035,
                ),
                SizedBox(
                    height: context.screenHeight * 0.21,
                    child: const Image(
                        image: AssetImage(AppImages.forgetPassowrd))),
                SizedBox(
                  height: context.screenHeight * 0.015,
                ),
                TextArabicWithStyle(
                    text: 'تعيين كلمة مرور جديدة', textsyle: Styles.textstyle18),
                TextArabicWithStyle(
                    text: 'ادخل رقم الهاتف او البريد الالكتروني للمتابعة',
                    textsyle: Styles.textstyle12
                        .copyWith(color: Colors.black.withOpacity(0.66))),

               SizedBox(
                    height: context.screenHeight * 0.035,
                  ),

               const LabelAndTextField(
                      text: 'البريد الالكتروني أو رقم الهاتف',
                      hintText: 'ادخل بريدك الالكتروني أو رقم هاتفك'),
               const Spacer(flex: 3,),
               SizedBox(
                      width: context.screenWidth * 0.9,
                      child: CustomButton(text: 'إرسال طلب تغيير كلمة المرور' , onPressed: (){
                        GoRouter.of(context).push(Approuter.otp);
                      },)),
              const Spacer(flex: 1,),
              ],
            ),
          )
        ],
      ),
    );
  }
}