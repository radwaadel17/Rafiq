import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/Label_and_text_field_widget.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:app/features/update_password/presentation/manager/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:app/features/update_password/presentation/manager/forget%20password%20cubit/forget_password_states.dart';
import 'package:app/features/update_password/presentation/views/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordFaluireState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage),
            ),
          );
        } else if (state is ForgetPasswordSucssesState) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return OtpScreen(
                  email: textEditingController.text,
                );
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
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                                child: Transform(
                                  transform: Matrix4.identity()..scale(-1.0, 1.0),
                                  child: Image.asset(AppImages.blueArrowBack)),
                              )))
                    ],
                  ),
                )),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Form(
                  key: globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.screenHeight * 0.035,
                      ),
                      SizedBox(
                          height: context.screenHeight * 0.21,
                          child: const Image(
                              image: AssetImage(AppImages.forgetPassowrd))),
                      SizedBox(
                        height: context.screenHeight * 0.015,
                      ),
                      TextArabicWithStyle(
                          text: 'تعيين كلمة مرور جديدة',
                          textsyle: Styles.textstyle18),
                      TextArabicWithStyle(
                          text: 'ادخل رقم الهاتف او البريد الالكتروني للمتابعة',
                          textsyle: Styles.textstyle12
                              .copyWith(color: Colors.black.withOpacity(0.66))),
                      SizedBox(
                        height: context.screenHeight * 0.035,
                      ),
                      LabelAndTextField(
                          controller: textEditingController,
                          text: 'البريد الالكتروني أو رقم الهاتف',
                          hintText: 'ادخل بريدك الالكتروني أو رقم هاتفك'),
                      const Spacer(
                        flex: 3,
                      ),
                      SizedBox(
                          width: context.screenWidth * 0.9,
                          child: CustomButton(
                            check: state is ForgetPasswordLoadingState ? true : false,
                            text: 'إرسال طلب تغيير كلمة المرور',
                            onPressed: () {
                               if (globalKey.currentState!.validate()){
                                 globalKey.currentState!.save();
                                  BlocProvider.of<ForgetPasswordCubit>(context)
                                  .forgetPassword(
                                      email: textEditingController.text);
                               }
                               else{
                                  autovalidateMode = AutovalidateMode.always;
                                  setState(() {});
                               }
                             
                            },
                          )),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
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
