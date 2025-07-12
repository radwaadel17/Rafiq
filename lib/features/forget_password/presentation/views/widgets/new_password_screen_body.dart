import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/Label_and_text_field_password.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/features/forget_password/presentation/manager/reset%20password%20cubit/reset_password_cubit.dart';
import 'package:app/features/forget_password/presentation/manager/reset%20password%20cubit/reset_password_states.dart';
import 'package:app/features/sign%20in/presentation/views/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NewPasswordBody extends StatefulWidget {
  const NewPasswordBody({super.key, required this.email});
  final String email;

  @override
  State<NewPasswordBody> createState() => _NewPasswordBodyState();
}

class _NewPasswordBodyState extends State<NewPasswordBody> {
  String pass1 = '';
  String pass2 = '';
  bool obscureText1 = false;
  bool obscureText2 = false;
  void togglePasswordView() {
    setState(() {
      obscureText1 = !obscureText1;
    });
  }
  void togglePasswordView2() {
    setState(() {
      obscureText2 = !obscureText2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordFaluireState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.errorMessage,
                textAlign: TextAlign.left,
              ),
            ),
          );
        } else if (state is ResetPasswordSucssesStateinit) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: greenColor,
              content: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    state.msg,
                    textAlign: TextAlign.left,
                  )),
            ),
          );
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return const SignInScreen();
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
                )),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: context.screenHeight * 0.25,
                        child: const Image(
                            image: AssetImage(AppImages.forgetPassowrd))),
                    SizedBox(
                      height: context.screenHeight * 0.035,
                    ),
                    TextArabicWithStyle(
                        text: 'أعد تعيين كلمة المرور',
                        textsyle: Styles.textstyle18),
                    SizedBox(
                      height: context.screenHeight * 0.035,
                    ),
                    LabelAndTextFieldPassword(
                        onChanged: (data) {
                          pass1 = data;
                        },
                        text: 'كلمة المرور الجديدة',
                        hintText: 'أدخل كلمة المرور', obscureText: obscureText1 , onPressed: togglePasswordView,),
                    SizedBox(
                      height: context.screenHeight * 0.025,
                    ),
                    LabelAndTextFieldPassword(
                        onChanged: (data) {
                          pass2 = data;
                        },
                        text: 'تأكيد كلمة المرور',
                        hintText: 'ادخل كلمة المرور', obscureText: obscureText2, onPressed: togglePasswordView2),
                    const Spacer(
                      flex: 3,
                    ),
                    SizedBox(
                        width: context.screenWidth * 0.9,
                        child: CustomButton(
                          check: state is ResetPasswordLoadingState ? true : false,
                          text: 'تأكيد',
                          onPressed: () {
                            if (pass1 != pass2) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('كلمتا المرور غير متطابقتين'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            BlocProvider.of<ResetPasswordCubit>(context)
                                .resetPassword(
                                    email: widget.email,
                                    pass1: pass1,
                                    pass2: pass2);
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
