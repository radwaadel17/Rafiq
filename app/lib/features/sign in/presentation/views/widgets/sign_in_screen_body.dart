import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/Label_and_text_field_widget.dart';
import 'package:app/core/widgets/container_box.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.screenHeight * 0.035,
                  ),
                  SizedBox(
                      height: context.screenHeight * 0.21,
                      child: const Image(
                          image: AssetImage(AppImages.signInPhoto))),
                  SizedBox(
                    height: context.screenHeight * 0.015,
                  ),
                  TextArabicWithStyle(
                      text: 'لديك حساب بالفعل', textsyle: Styles.textstyle18),
                  TextArabicWithStyle(
                      text: 'ادخل جميع بيناتك حتي تتمكن من تسجيل الدخول',
                      textsyle: Styles.textstyle12
                          .copyWith(color: Colors.black.withOpacity(0.66))),
                  SizedBox(
                    height: context.screenHeight * 0.035,
                  ),
                  const LabelAndTextField(
                      text: 'البريد الالكتروني أو رقم الهاتف',
                      hintText: 'ادخل بريدك الالكتروني أو رقم هاتفك'),
                  SizedBox(
                    height: context.screenHeight * 0.025,
                  ),
                  const LabelAndTextField(
                      text: 'كلمة المرور', hintText: 'ادخل كلمة المرور'),
                  SizedBox(
                    height: context.screenHeight * 0.010,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                          GoRouter.of(context).push(Approuter.forgetPassword);
                          },
                          child: TextArabicWithStyle(
                              text: 'هل نسيت كلمة السر؟ ',
                              textsyle: Styles.textstyle12.copyWith(
                                  color: const Color(0xff575757),
                                  decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.030,
                  ),
                  SizedBox(
                      width: context.screenWidth * 0.9,
                      child: const CustomButton(text: 'تسجيل الدخول')),
                  SizedBox(
                    height: context.screenHeight * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(Approuter.signIn);
                          },
                          child: TextArabicWithStyle(
                              text: 'انشاء حساب ',
                              textsyle: Styles.textstyle18
                                  .copyWith(fontSize: 14.sp))),
                      TextArabicWithStyle(
                          text: 'ليس لديك حساب؟ ',
                          textsyle: Styles.textstyle18.copyWith(
                              fontSize: 14.sp, color: const Color(0xff575757))),
                    ],
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.030,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 4,
                      ),
                      ContainerBox(image: AppImages.facebookLogo),
                      Spacer(
                        flex: 1,
                      ),
                      ContainerBox(image: AppImages.googleLogo),
                      Spacer(
                        flex: 4,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
