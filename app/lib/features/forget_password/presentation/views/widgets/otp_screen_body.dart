import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/features/forget_password/presentation/views/widgets/otp_box_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OtpScreenBody extends StatelessWidget {
  const OtpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 12.h,
                        child: GestureDetector(
                          onTap: (){
                            GoRouter.of(context).pop();
                          },
                          child: Image.asset(AppImages.blueArrowBack)))
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                SizedBox(
                    height: context.screenHeight * 0.28,
                    child: Image.asset(AppImages.otpPhoto)),
                SizedBox(
                  height: context.screenHeight * 0.035,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: SizedBox(
                      width: context.screenWidth * 0.98,
                      child: TextArabicWithStyle(
                        text:
                            'يرجى إدخال رمز التحقق المكون من 4 أرقام الذي تم إرساله إلى رقم هاتفك المحمول. ',
                        textsyle: Styles.textstyle14,
                        textAlign: TextAlign.center,
                      )),
                ),
                TextArabicWithStyle(
                    text: 'إذا لم تستلم الرمز، يمكنك طلب إعادة الإرسال',
                    textsyle: Styles.textstyle14),
              SizedBox(
                  height: context.screenHeight * 0.035,
                ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OtpBoxConatiner(numebr: '2',),
                    OtpBoxConatiner(numebr: '4',),
                    OtpBoxConatiner(numebr: '7',),
                    OtpBoxConatiner(numebr: '9',),
                  ],
                ),
                const Spacer(flex: 2,),
                TextArabicWithStyle(
                    text: 'أعد الارسال ',
                    textsyle: Styles.textstyle18.copyWith(fontWeight: FontWeight.normal , decoration: TextDecoration.underline)),
                 const Spacer(flex: 2,),
                 SizedBox(
                      width: context.screenWidth * 0.9,
                      child: CustomButton(text: 'تم' , onPressed: (){
                        GoRouter.of(context).push(Approuter.newPassword);
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
