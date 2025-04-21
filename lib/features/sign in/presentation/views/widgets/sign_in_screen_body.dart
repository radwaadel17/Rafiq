import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/Label_and_text_field_password.dart';
import 'package:app/core/widgets/Label_and_text_field_widget.dart';
import 'package:app/core/widgets/container_box.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/features/sign%20in/domain/entity/user_signin_entity.dart';
import 'package:app/features/sign%20in/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:app/features/sign%20in/presentation/manager/sign_in_cubit/sign_in_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  UserSigninEntity user = UserSigninEntity(email: '', password: '');
  bool obscureText = false;
  void togglePasswordView() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInCubitState>(
      listener: (context, state) {
        if (state is SignInCubitFaluireState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage),
            ),
          );
        } else if (state is SignInCubitSucsessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('valid user'),
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
                  child: Form(
                    key: globalKey,
                    autovalidateMode: autovalidateMode,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: context.screenHeight * 0.035,
                        ),
                        SizedBox(
                            height: context.screenHeight * 0.21,
                            child: const Image(image: AssetImage(AppImages.signInPhoto))),
                        SizedBox(
                          height: context.screenHeight * 0.015,
                        ),
                        TextArabicWithStyle(text: 'لديك حساب بالفعل', textsyle: Styles.textstyle18),
                        TextArabicWithStyle(
                            text: 'ادخل جميع بيناتك حتي تتمكن من تسجيل الدخول',
                            textsyle: Styles.textstyle12.copyWith(color: Colors.black.withOpacity(0.66))),
                        SizedBox(
                          height: context.screenHeight * 0.035,
                        ),
                        LabelAndTextField(
                            onChanged: (data) {
                              user.email = data;
                            },
                            text: 'البريد الالكتروني أو رقم الهاتف',
                            hintText: 'ادخل بريدك الالكتروني أو رقم هاتفك'),
                        SizedBox(
                          height: context.screenHeight * 0.025,
                        ),
                        LabelAndTextFieldPassword(
                          onChanged: (data) {
                            user.password = data;
                          },
                          text: 'كلمة المرور',
                          hintText: 'ادخل كلمة المرور',
                          obscureText: obscureText,
                          onPressed: togglePasswordView,
                        ),
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
                                    textAlign: TextAlign.left,
                                    text: 'هل نسيت كلمة السر؟ ',
                                    textsyle: Styles.textstyle12.copyWith(
                                        color: const Color(0xff575757), decoration: TextDecoration.underline)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.030,
                        ),
                        SizedBox(
                            width: context.screenWidth * 0.9,
                            child: CustomButton(
                              check: state is SignInCubitLoadingState ? true : false,
                              text: 'تسجيل الدخول',
                              onPressed: () {
                                // if (globalKey.currentState!.validate()) {
                                //   globalKey.currentState!.save();
                                //   BlocProvider.of<SignInCubit>(context)
                                //       .logIn(user);
                                // } else {
                                //   autovalidateMode = AutovalidateMode.always;
                                //   setState(() {});
                                // }
                                GoRouter.of(context).go('/home');
                              },
                            )),
                        SizedBox(
                          height: context.screenHeight * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  GoRouter.of(context).push(Approuter.youAre);
                                },
                                child: TextArabicWithStyle(
                                    text: 'انشاء حساب ', textsyle: Styles.textstyle18.copyWith(fontSize: 14.sp))),
                            TextArabicWithStyle(
                                text: 'ليس لديك حساب؟ ',
                                textsyle: Styles.textstyle18.copyWith(fontSize: 14.sp, color: const Color(0xff575757))),
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
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
