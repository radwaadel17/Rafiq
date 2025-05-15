import 'package:another_flushbar/flushbar.dart';
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/app_input_num.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/presentation/views/screens/relation_view.dart';
import 'package:app/features/questions/presentation/views/widgets/add_minus_container.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AgeViewBody extends StatefulWidget {
  const AgeViewBody({super.key, required this.qsEntity});
  final QsEntity qsEntity;
  @override
  State<AgeViewBody> createState() => _AgeViewBodyState();
}

class _AgeViewBodyState extends State<AgeViewBody> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  "دعنا نتعرف علي عمر الصغير ",
                  style: Styles.textstyle20,
                ),
                const Gap(24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppInputNum(
                    controller: textEditingController,
                    onChanged: (data) {},
                    hintText: 'ادخل العمر هنا',
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AddMinusContainer(
                      onTap: () {
                        int num = int.tryParse(textEditingController.text) ?? 0;
                        if (num <= 15) {
                          num++;
                        }

                        setState(() {
                          textEditingController.text = num.toString();
                        });
                      },
                      color: greenColor,
                      icon: Icons.add,
                    ),
                    AddMinusContainer(
                      onTap: () {
                        int num = int.tryParse(textEditingController.text) ?? 0;
                        if (num != 0) {
                          num--;
                        }
                        setState(() {
                          textEditingController.text = num.toString();
                        });
                      },
                      color: Colors.red,
                      icon: Icons.remove,
                    ),
                  ],
                )
              ],
            )),
        Positioned(
          right: 0,
          bottom: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: CustomButton(
              onPressed: () {
                if (textEditingController.text.isEmpty) {
                  Flushbar(
                    backgroundColor: Colors.red,
                    messageText: Text(
                      "برجاء ادخال العمر قبل الانتقال الى الاسئلة",
                      style: Styles.textstyle12.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    duration: const Duration(seconds: 2),
                    margin: const EdgeInsets.all(8),
                    borderRadius: BorderRadius.circular(8),
                    flushbarPosition: FlushbarPosition.BOTTOM,
                  ).show(context);
                  return;
                }
                widget.qsEntity.age = int.parse(textEditingController.text);

                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return RelationView(
                        qsEntity: widget.qsEntity,
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
              text: 'التالي',
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),
        ),
      ],
    );
  }
}
