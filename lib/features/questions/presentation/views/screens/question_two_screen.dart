import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_image.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class QuestionTwoScreen extends StatefulWidget {
  const QuestionTwoScreen({super.key});

  @override
  State<QuestionTwoScreen> createState() => _QuestionTwoScreenState();
}

class _QuestionTwoScreenState extends State<QuestionTwoScreen> {
  final List<String> options = const [
    'أقل من سنتين',
    '2-4 سنوات',
    '5-7 سنوات',
    '8 سنوات فأكثر',
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      "عمر الصغير",
                      style: Styles.textstyle20,
                    ),
                    const Gap(20),
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: TextButton(
                              onPressed: () {
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  context.goNamed('question_three');
                                });
                              },
                              child: Text(
                                "•  ${options[index]}",
                                style: Styles.textstyle16.copyWith(
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
