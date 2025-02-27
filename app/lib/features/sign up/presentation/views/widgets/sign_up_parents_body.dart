import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/Label_and_text_field_widget.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/check_box_widget.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/custom_button.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_container_box.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpParentsBody extends StatelessWidget {
  const SignUpParentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
            height: context.screenHeight * 0.010,
          )),
          const SliverToBoxAdapter(
            child: SignUpCustomAppBar(),
          ),
          const SliverToBoxAdapter(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              SignUpContainerBox(
                image: AppImages.googleLogo,
              ),
              Spacer(
                flex: 1,
              ),
              SignUpContainerBox(
                image: AppImages.facebookLogo,
              ),
              Spacer(
                flex: 2,
              ),
            ],
          )),
          SliverToBoxAdapter(
              child: SizedBox(
            height: context.screenHeight * 0.020,
          )),
          SliverToBoxAdapter(
              child: Column(
            children: [
              const LabelAndTextField(
                  text: 'الأسم بالكامل', hintText: 'ادخل اسمك بالكامل'),
              SizedBox(
                height: context.screenHeight * 0.010,
              ),
              const LabelAndTextField(text: 'سن طفلك', hintText: 'ادخل سن طفلك من 0-15'),
              SizedBox(
                height: context.screenHeight * 0.010,
              ),
              const LabelAndTextField(
                  text: 'البريد الإلكتروني', hintText: 'ادخل بريدك الإلكتروني'),
              SizedBox(
                height: context.screenHeight * 0.010,
              ),
              const LabelAndTextField(
                  text: 'رقم الموبايل', hintText: 'ادخل رقم الموبايل'),
              SizedBox(
                height: context.screenHeight * 0.010,
              ),
              const LabelAndTextField(
                  text: 'كلمة المرور', hintText: 'ادخل كلمة المرور '),
              SizedBox(
                height: context.screenHeight * 0.006,
              ),
            ],
          )),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const CheckBox(),
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const CustomButton(),
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: context.screenHeight * 0.010,
          )),
          SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                       GoRouter.of(context).push(Approuter.signIn);
                        },
                        child: TextArabicWithStyle(
                            text: ' تسجيل الدخول',
                            textsyle:
                                Styles.textstyle18.copyWith(fontSize: 14.sp))),
                    TextArabicWithStyle(
                        text: 'لديك حساب بالفعل ؟',
                        textsyle: Styles.textstyle18.copyWith(
                            fontSize: 14.sp, color: const Color(0xff575757))),
                  ],
                )),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: context.screenHeight * 0.020,
          )),
        ],
      ),
    );
  }
}
