import 'package:another_flushbar/flushbar.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/service_locator.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/app_input.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/questions/data/repos/result_repo_imp.dart';
import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/presentation/manager/result_cubit.dart';
import 'package:app/features/questions/presentation/views/screens/age.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class QuestionOneScreen extends StatefulWidget {
  const QuestionOneScreen({super.key});

  @override
  State<QuestionOneScreen> createState() => _QuestionOneScreenState();
}

class _QuestionOneScreenState extends State<QuestionOneScreen> {
  QsEntity qsEntity = QsEntity();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResultCubit(getIt<ResultRepoImp>()),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              const CatPhoto(),
              const GiraffePhoto(),
              Positioned(
                  left: 0,
                  right: 0,
                  top: context.screenHeight * 0.33,
                  child: Column(
                    children: [
                      Text(
                        "دعنا نتعرف علي اسم الصغير",
                        style: Styles.textstyle20,
                      ),
                      const Gap(24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AppInput(
                          controller: textEditingController,
                          onChanged: (data) {},
                          hintText: 'ادخل الأسم هنا',
                        ),
                      ),
                    ],
                  )),
              Positioned(
                right: 0,
                bottom: 0,
                left: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: CustomButton(
                    text: 'التالي',
                    borderRadius: BorderRadius.circular(50.r),
                    onPressed: () {
                      if (textEditingController.text.isEmpty) {
                        Flushbar(
                          backgroundColor: Colors.red,
                          messageText: Text(
                            "برجاء ادخال الاسم قبل الانتقال الى الاسئلة",
                            style: Styles.textstyle12
                                .copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          duration: const Duration(seconds: 2),
                          margin: const EdgeInsets.all(8),
                          borderRadius: BorderRadius.circular(8),
                          flushbarPosition: FlushbarPosition.BOTTOM,
                        ).show(context);
                        return;
                      }
                      qsEntity.name = textEditingController.text;
                      print('${qsEntity.name}');
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return AgeView(
                              qsEntity: qsEntity,
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
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
