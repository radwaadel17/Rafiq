import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/Label_and_text_field_widget.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_container_box.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_custom_app_bar.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpDoctorBody extends StatelessWidget {
  const SignUpDoctorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
                height: context.screenHeight * 0.015,
              ),
              const LabelAndTextField(text: 'التخصص', hintText: 'ادخل تخصصك'),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              const LabelAndTextField(
                  text: 'البريد الإلكتروني', hintText: 'ادخل بريدك الإلكتروني'),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              const LabelAndTextField(
                  text: 'رقم الموبايل', hintText: 'ادخل رقم الموبايل'),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              const LabelAndTextField(
                  text: 'كلمة المرور', hintText: 'ادخل كلمة المرور '),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
            ],
          )),
         const SliverToBoxAdapter(
              child: CheckBox())
        ],
      ),
    );
  }
}

class CheckBox extends StatelessWidget {
  const CheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                children: [
    Row(
      children: [
        TextArabicWithStyle(
            text: ' الشروط والأحكـام',
            textsyle: Styles.textstyle12.copyWith(fontSize: 14.sp , color: colorApp)),
        TextArabicWithStyle(
            text: 'اوافق على',
            textsyle: Styles.textstyle12
                .copyWith(fontSize: 14.sp)),
        Checkbox(
          value: false, onChanged: (newValue) {},
          shape: RoundedRectangleBorder(
            // جعل الـ Checkbox دائري الزوايا
            borderRadius:
                BorderRadius.circular(6), // التحكم في التدوير
          ),
          side: const BorderSide(
              color: colorApp, width: 2), // لون الإطار
        ),
      ],
    )
                ],
              );
  }
}
