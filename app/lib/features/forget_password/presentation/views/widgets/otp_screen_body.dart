import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/features/forget_password/presentation/manager/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:app/features/forget_password/presentation/manager/forget%20password%20cubit/forget_password_states.dart';
import 'package:app/features/forget_password/presentation/manager/reset%20password%20cubit/reset_password_cubit.dart';
import 'package:app/features/forget_password/presentation/manager/reset%20password%20cubit/reset_password_states.dart';
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
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: Image.asset(AppImages.blueArrowBack),
                        )),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordSucssesState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color(0xff4456A5),
                      content: Text('Code is sent to your email'),
                    ),
                  );
                } else if (state is ForgetPasswordFaluireState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage)),
                  );
                }
              },
              builder: (context, state) {
                return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                  listener: (context, otpState) {
                    if (otpState is ResetPasswordFaluireState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(otpState.errorMessage),
                        ),
                      );
                    } else if (otpState is ResetPasswordSucssesStateinit) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(otpState.msg)),
                      );
                      GoRouter.of(context).push(Approuter.newPassword);
                    }
                  },
                  builder: (context, otpState) {
                    return Column(
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
                          onTap: () {
                            BlocProvider.of<ForgetPasswordCubit>(context)
                                .forgetPassword(email: widget.email);
                          },
                          child: state is ForgetPasswordLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : TextArabicWithStyle(
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
                            check: otpState is ResetPasswordLoadingState
                                ? true
                                : false,
                            text: 'تم',
                            onPressed: () {
                              String resetCode = textEditingControllerOne.text +
                                textEditingControllerTwo.text +
                                textEditingControllerThree.text +
                                textEditingControllerFour.text;
                              BlocProvider.of<ResetPasswordCubit>(context).resetPassword(email: widget.email, resetCode: resetCode);
                            
                            },
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
