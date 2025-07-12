import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/Label_and_text_field_age_of_child.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/core/widgets/Label_and_text_field_widget.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/container_box.dart';
import 'package:app/features/sign%20up/presentation/manager/signup%20cubit/sign_up_cubit.dart';
import 'package:app/features/sign%20up/presentation/manager/signup%20cubit/sign_up_states_cubit.dart';
import 'package:app/features/sign%20up/presentation/views/otp_verfication.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/check_box_widget.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class SignUpParentsBody extends StatefulWidget {
  const SignUpParentsBody({super.key, required this.user});
  final UserSignupEntity user;

  @override
  State<SignUpParentsBody> createState() => _SignUpParentsBodyState();
}

class _SignUpParentsBodyState extends State<SignUpParentsBody> {
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool checkBox = false;
  bool obscureText = false;
  void togglePasswordView() {
    setState(() {
      obscureText = !obscureText;
    });
  }
  final Box box = Hive.box('userName');
  final Box boxMail = Hive.box('userEmail');


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignupFaluireState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Align(
                alignment: Alignment.centerLeft,
                child: Text(state.errorMsg)),
            ),
          );
        } else if (state is SignupSuccesesState) {
          ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
              backgroundColor: greenColor,
              content: Align(
                alignment: Alignment.centerLeft,
                child: Text('User successfully created')),
            ),
          );
          debugPrint(state.message);
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
                child: CustomAppbarSignIn(),
              ), 
              SliverToBoxAdapter(
                  child: SizedBox(
                height: context.screenHeight * 0.030,
              )),
              /* const SliverToBoxAdapter(
                child: SignUpCustomAppBar(),
              ), */

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
                    const LabelAndTextFieldAge(
                        text: 'سن طفلك', hintText: 'ادخل سن طفلك من 0-15'),
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
                    LabelAndTextField(
                        onChanged: (data) {
                          widget.user.passowrd = data;
                          widget.user.passwordConfirmation = data;
                        },
                        text: 'كلمة المرور',
                        hintText: 'ادخل كلمة المرور '),
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
                    check: state is SignUpLoadingStatesCubit ? true  : false,
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
                        box.put('AccName', widget.user.name);
                        boxMail.put('EmailName', widget.user.email);
                        String check = boxMail.get('EmailName');
                        print('${widget.user.email} , $check');
                        /* BlocProvider.of<SignUpCubit>(context)
                            .signUp(widget.user); */
                          GoRouter.of(context).go('/home');
                      } else {
                        autovalidateMode = AutovalidateMode.always;

                        setState(() {});
                      }
                    },
                    text: "انشاء حساب",
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
class CustomAppbarSignIn extends StatelessWidget {
  const CustomAppbarSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            SizedBox(
              height: 12.h,
              child: Image.asset(Assets.images.arrowBackBlue.path)),
        
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('إنشاء حساب جديد' , textAlign: TextAlign.right, style: Styles.textstyle18,),
                  Text('  ادخل جميع بيناتك حتي تتمكن من إنشاء حساب' , textAlign: TextAlign.right, style: Styles.textstyle12.copyWith(color: const Color(0xff575757)) ,)
                      
                ],
              ),
            )
          ],
        ),
      ));
  }
}
