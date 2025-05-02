import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/Label_and_text_field_password.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/core/widgets/Label_and_text_field_widget.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/features/sign%20up/presentation/manager/signup%20cubit/sign_up_cubit.dart';
import 'package:app/features/sign%20up/presentation/manager/signup%20cubit/sign_up_states_cubit.dart';
import 'package:app/features/sign%20up/presentation/views/otp_verfication.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/check_box_widget.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/container_box.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpDoctorBody extends StatefulWidget {
  const SignUpDoctorBody({super.key, required this.user});
  final UserSignupEntity user;

  @override
  State<SignUpDoctorBody> createState() => _SignUpDoctorBodyState();
}

class _SignUpDoctorBodyState extends State<SignUpDoctorBody> {
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool checkBox = false;
  bool obscureText = false;
  void togglePasswordView() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignupFaluireState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMsg),
            ),
          );
        } else if (state is SignupSuccesesState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor:const Color(0xff4456A5),
              content: Text(state.message),
            ),
          );
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return OtpVarfication(user: state.user);
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
                  child: SizedBox(
                height: context.screenHeight * 0.010,
              )),
              const SliverToBoxAdapter(
                child: SignUpCustomAppBar(),
              ),
              SliverToBoxAdapter(child: Center(child: Text("إنشاء حساب جديد" , style: Styles.textstyle18,))) ,
              SliverToBoxAdapter(
                  child: SizedBox(
                height: context.screenHeight * 0.010,
              )),
              SliverToBoxAdapter(child: Center(child: Text("ادخل جميع بيناتك حتي تتمكن من إنشاء حساب" , style: Styles.textstyle12,))) ,
              SliverToBoxAdapter(
                  child: SizedBox(
                height: context.screenHeight * 0.010,
              )),
              const SliverToBoxAdapter(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  ContainerBox(
                    image: AppImages.googleLogo,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  ContainerBox(
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
                  child: Form(
                key: globalKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    LabelAndTextField(
                        onChanged: (data) {
                          widget.user.name = data;
                        },
                        text: 'الأسم بالكامل',
                        hintText: 'ادخل اسمك بالكامل'),
                    SizedBox(
                      height: context.screenHeight * 0.010,
                    ),
                    const LabelAndTextField(
                        text: 'التخصص', hintText: 'ادخل تخصصك'),
                    SizedBox(
                      height: context.screenHeight * 0.010,
                    ),
                    LabelAndTextField(
                        onChanged: (data) {
                          widget.user.email = data;
                        },
                        text: 'البريد الإلكتروني',
                        hintText: 'ادخل بريدك الإلكتروني'),
                    SizedBox(
                      height: context.screenHeight * 0.010,
                    ),
                    LabelAndTextField(
                        onChanged: (data) {
                          widget.user.phoneNumber = int.parse(data);
                        },
                        text: 'رقم الموبايل',
                        hintText: 'ادخل رقم الموبايل'),
                    SizedBox(
                      height: context.screenHeight * 0.010,
                    ),
                    LabelAndTextFieldPassword(
                      onPressed: togglePasswordView,
                      obscureText: obscureText,
                      onChanged: (data) {
                        widget.user.passowrd = data;
                        widget.user.passwordConfirmation = data;
                      },
                      text: 'كلمة المرور',
                      hintText: 'ادخل كلمة المرور ',
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.006,
                    ),
                  ],
                ),
              )),
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: CheckBox(
                  check: checkBox,
                  onChanged: (newValue) {
                    setState(() {
                      checkBox = newValue ?? false;
                    });
                  },
                ),
              )),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomButton(
                    check: state is SignUpLoadingStatesCubit ? true : false,
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        globalKey.currentState!.save();
                        if (checkBox == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Align(
                                  alignment: Alignment.topRight,
                                  child:
                                      Text('يجب الموافقة على الشروط والأحكام')),
                            ),
                          );
                          return;
                        }
                        BlocProvider.of<SignUpCubit>(context)
                            .signUp(widget.user);
                      } else {
                        autovalidateMode = AutovalidateMode.always;

                        setState(() {});
                      }
                    },
                    text: 'انشاء حساب',
                  ),
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
                      
                        TextArabicWithStyle(
                            text: 'لديك حساب بالفعل ؟',
                            textsyle: Styles.textstyle18.copyWith(
                                fontSize: 14.sp,
                                color: const Color(0xff575757))),
                                GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(Approuter.signIn);
                            },
                            child: TextArabicWithStyle(
                                text: ' تسجيل الدخول',
                                textsyle: Styles.textstyle18
                                    .copyWith(fontSize: 14.sp))),
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
      },
    );
  }
}
