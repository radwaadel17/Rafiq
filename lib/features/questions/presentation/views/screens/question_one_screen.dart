import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/app_input.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_image.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class QuestionOneScreen extends StatelessWidget {
  const QuestionOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            const CatImage(
              flex: 3,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
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
                        controller: TextEditingController(),
                        onChanged: (data) {},
                        hintText: 'ادخل الأسم هنا',
                        onFieldSubmitted: (v) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            context.goNamed('question_two');
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const GiraffeImage(
              flex: 3,
              padding: 40,
            ),
          ],
        ),
      ),
    );
  }
}
