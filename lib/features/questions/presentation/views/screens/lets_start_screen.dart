import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/app_button.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LetsStartScreen extends StatelessWidget {
  const LetsStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.images.note.path,
                  height: 230,
                ),
                const Gap(32),
                Text(
                  "“لنبدأ معًا!",
                  style: Styles.textstyle18.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(6),
                Text(
                  "لدينا بعض الأسئلة عن اهتمامات طفلك وتطوره، وإجاباتك ستساعدنا في تقديم تدريبات مناسبة لطفلك داخل التطبيق. الأمر لن يستغرق أكثر من 5 دقائق، وفي النهاية ستحصل على تقرير مجاني يحتوي على ملاحظات مفيدة ونصائح عملية تساعدك في دعم نمو طفلك بأفضل طريقة.”",
                  style: Styles.textstyle18,
                  textAlign: TextAlign.center,
                ),
                const Gap(24),
                AppButton(
                  onTap: () {
                    context.goNamed('question_one');
                  },
                  text: "هيا بنا",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
