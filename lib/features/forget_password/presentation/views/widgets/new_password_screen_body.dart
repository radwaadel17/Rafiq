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

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({super.key, required this.email});
  final String email;
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
                      height: 12.h, child: GestureDetector(
                        onTap: (){
                          GoRouter.of(context).pop();
                        },
                        child: Image.asset(AppImages.blueArrowBack)))
                ],
              ),
            )),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: context.screenHeight * 0.25,
                    child:
                        const Image(image: AssetImage(AppImages.forgetPassowrd))),
                SizedBox(
                  height: context.screenHeight * 0.035,
                ),
                TextArabicWithStyle(
                    text: 'أعد تعيين كلمة المرور',
                    textsyle: Styles.textstyle18),
                SizedBox(
                  height: context.screenHeight * 0.035,
                ),
                const LabelAndTextField(
                    text: 'كلمة المرور الجديدة', hintText: 'أدخل كلمة المرور'),
                SizedBox(
                  height: context.screenHeight * 0.025,
                ),
                const LabelAndTextField(
                    text: 'تأكيد كلمة المرور', hintText: 'ادخل كلمة المرور'),
                const Spacer(
                  flex: 3,
                ),
                SizedBox(
                    width: context.screenWidth * 0.9,
                    child: CustomButton(text: 'تأكيد' , onPressed: (){
                   GoRouter.of(context).push(Approuter.signIn);
                    },)),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
