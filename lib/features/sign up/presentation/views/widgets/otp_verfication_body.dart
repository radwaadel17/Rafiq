import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/features/forget_password/presentation/views/widgets/otp_box_container.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/features/sign%20up/presentation/manager/verfiy%20email%20cubit/verfiy_email_states.dart';
import 'package:app/features/sign%20up/presentation/manager/verfiy%20email%20cubit/verfiy_emial_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OtpVerficationBody extends StatefulWidget {
  const OtpVerficationBody({super.key, required this.user});
  final UserSignupEntity user;

  @override
  State<OtpVerficationBody> createState() => _OtpVerficationBodyState();
}

class _OtpVerficationBodyState extends State<OtpVerficationBody> {
  TextEditingController textEditingControllerOne = TextEditingController();
  TextEditingController textEditingControllerTwo = TextEditingController();
  TextEditingController textEditingControllerThree = TextEditingController();
  TextEditingController textEditingControllerFour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerfiyEmailCubit, VerfiyEmailState>(
      listener: (context, state) {
        if (state is VerfiyEmailFaluireStates) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMsg),
            ),
          );
        } else if (state is VerfiyEmailSucssesStates) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xff4456A5),
              content: Align(
                alignment: Alignment.centerLeft,
                child: Text(state.msg)),
            ),
          );
          GoRouter.of(context).push(Approuter.signIn);
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
                                'يرجى إدخال رمز التحقق المكون من 4 أرقام الذي تم إرساله إلى الايميل الخاص بك. ',
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
                    TextArabicWithStyle(
                        text: 'أعد الارسال ',
                        textsyle: Styles.textstyle18.copyWith(
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline)),
                    const Spacer(
                      flex: 2,
                    ),
                    SizedBox(
                        width: context.screenWidth * 0.9,
                        child: CustomButton(
                          check:
                              state is VerfiyEmailLoadingStates ? true : false,
                          text: 'تم',
                          onPressed: () {
                            String code = textEditingControllerFour.text +
                                textEditingControllerThree.text +
                                textEditingControllerTwo.text +
                                textEditingControllerOne.text;
                                debugPrint(code);
                                debugPrint(widget.user.email);
                             BlocProvider.of<VerfiyEmailCubit>(context)
                                .verfiyEmail(
                                    email: widget.user.email!, code: code); 
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
