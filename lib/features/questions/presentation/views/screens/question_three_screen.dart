import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_image.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class QuestionThreeScreen extends StatefulWidget {
  const QuestionThreeScreen({super.key});

  @override
  State<QuestionThreeScreen> createState() => _QuestionThreeScreenState();
}

class _QuestionThreeScreenState extends State<QuestionThreeScreen> {
  final List<String> options = const [
    'نعم',
    'لا',
    'غير متأكد',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            const CatImage(
              flex: 1,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "هل تم تشخيص طفلك باضطراب طيف التوحد؟",
                    style: Styles.textstyle20,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(20),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "•  ${options[index]}",
                              style: Styles.textstyle20.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const GiraffeImage(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
