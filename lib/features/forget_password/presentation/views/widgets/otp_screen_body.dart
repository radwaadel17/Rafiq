import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/features/forget_password/presentation/manager/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:app/features/forget_password/presentation/manager/verfiyPasswordResetCode/verfyCubit.dart';
import 'package:app/features/forget_password/presentation/manager/verfiyPasswordResetCode/verfyPasswordStates.dart';
import 'package:app/features/forget_password/presentation/views/new_password_screen.dart';
import 'package:app/features/forget_password/presentation/views/widgets/otp_box_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OtpScreenBody extends StatefulWidget {
  const OtpScreenBody({super.key, required this.email});
  final String email;

  @override
  State<OtpScreenBody> createState() => _OtpScreenBodyState();
}

class _OtpScreenBodyState extends State<OtpScreenBody> {
 TextEditingController textEditingControllerOne = TextEditingController();
 TextEditingController textEditingControllerTwo = TextEditingController();
  TextEditingController textEditingControllerThree = TextEditingController();
  TextEditingController textEditingControllerFour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerfiyCubit, Verfiy>(
      listener: (context, state) {
         if (state is VPasswordFaluireState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage , textAlign: TextAlign.left,),
            ),
          );
        } else if (state is VSucssesStateinit) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              backgroundColor: greenColor,
              content: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(state.msg , textAlign: TextAlign.left,)),
            ),
          );
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return NewPasswordScreen(email: widget.email);
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SafeArea(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            height: 12.h,
                            child: GestureDetector(
                                onTap: () {
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
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OtpBoxContainer(
                          controller: textEditingControllerOne,
                        ),
                        OtpBoxContainer(
                          controller: textEditingControllerTwo,
                        ),
                        OtpBoxContainer(
                          controller: textEditingControllerThree,
                        ),
                        OtpBoxContainer(
                          controller: textEditingControllerFour,
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    GestureDetector(
                      onTap: (){
                        BlocProvider.of<ForgetPasswordCubit>(context).forgetPassword(email: widget.email);
                      },
                      child: TextArabicWithStyle(
                          text: 'أعد الارسال ',
                          textsyle: Styles.textstyle18.copyWith(
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline)),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    SizedBox(
                        width: context.screenWidth * 0.9,
                        child: CustomButton(

                          check: state is VPasswordLoadingState ? true : false,
                          text: 'تم',
                          onPressed: () {
                            String code = textEditingControllerFour.text +
                                textEditingControllerThree.text +
                                textEditingControllerTwo.text +
                                textEditingControllerOne.text;
                            BlocProvider.of<VerfiyCubit>(context).resetPassword(email: widget.email, resetCode: code); 
                          },
                        )),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
