import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/screens/gender.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/check_container.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class QuestionTwoScreen extends StatefulWidget {
 const QuestionTwoScreen( {super.key, required this.qsEntity});
 final QsEntity qsEntity ;

  @override
  State<QuestionTwoScreen> createState() => _QuestionTwoScreenState();
}

class _QuestionTwoScreenState extends State<QuestionTwoScreen> {
  final List<Map<String, dynamic>> sections = [
    {
      'title': '👫 التفاعل الاجتماعي واللعب',
      'questions': [
        'هل يبدي الطفل اهتمامًا بالأطفال الآخرين (مثل اللعب معهم أو مشاهدتهم)؟',
        'هل يستمتع الطفل بلعبة الغميضة أو الكشف (مثل إخفاء الوجه والظهور)؟',
        'هل يمارس الطفل اللعب التخيلي (مثل التظاهر باستخدام الهاتف أو الدمى)؟'
      ],
    },
    {
      'title': '🤸‍♂️ النشاط الجسدي', 
      'questions': [
        'هل يستمتع الطفل بالتأرجح أو التقافز (مثل على الأرجوحة أو عند حمله)؟',
        'هل يحب الطفل التسلق على الأشياء (مثل السلالم أو الأثاث)؟'
      ],
    },
    {
      'title': '🗣️ التواصل والانخراط'
, 
      'questions': [
        'هل يشير الطفل بإصبع السبابة لطلب شيء (مثل لعبة أو طعام)؟',
        'هل يشير الطفل بإصبع السبابة لإظهار الاهتمام (مثل الإشارة إلى طائر)؟',
        'هل يلعب الطفل بشكل صحيح مع الألعاب الصغيرة (مثل تركيب المكعبات)؟',
        'هل يحضر الطفل أشياء ليظهرها لك (مثل لعبة أو كتاب)؟',
        'هل يحافظ الطفل على التواصل البصري معك لأكثر من ثانية في كل مرة؟'
      ],
    },
     {
      'title': '📋 معلومات إضافية',
      'questions': [
         "هل عانى من الصفراء عند الولادة؟",
         "هل يوجد تاريخ عائلي مع التوحد؟",
         "هل تم استخدام التطبيق من قبل ؟",
      ],
    },
  ];

  int currentSectionIndex = 0;
  int currentQuestionIndex = 0;
  List<List<bool?>> allAnswers = [];
  bool? selectedAnswer;

  @override
  void initState() {
    super.initState();
    allAnswers = List.generate(
      sections.length,
      (i) => List<bool?>.filled(sections[i]['questions'].length, null),
    );
  }

  void _next() {
    if (selectedAnswer == null) {
     /*  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'الرجاء اختيار إجابة قبل الانتقال للسؤال التالي',
            style: Styles.textstyle12.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ); */
      return;
    }

    allAnswers[currentSectionIndex][currentQuestionIndex] = selectedAnswer;

    if (currentQuestionIndex <
        sections[currentSectionIndex]['questions'].length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
    } else if (currentSectionIndex < sections.length - 1) {
      setState(() {
        currentSectionIndex++;
        currentQuestionIndex = 0;
        selectedAnswer = null;
      });
    } else {
        widget.qsEntity.qs1 = allAnswers[0][0];
        widget.qsEntity.qs2 = allAnswers[0][1];
        widget.qsEntity.qs3 = allAnswers[0][2];
        widget.qsEntity.qs4 = allAnswers[1][0];
        widget.qsEntity.qs5 = allAnswers[1][1];
        widget.qsEntity.qs6 = allAnswers[2][0];
        widget.qsEntity.qs7 = allAnswers[2][1];
        widget.qsEntity.qs8 = allAnswers[2][2];
        widget.qsEntity.qs9 = allAnswers[2][3];
        widget.qsEntity.qs10 = allAnswers[2][4];
        widget.qsEntity.disease = allAnswers[3][0];
        widget.qsEntity.haveHisory = allAnswers[3][1];
       Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return GenderView(qsEntity: widget.qsEntity);
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
       // Debugging line
    }
  }

  @override
  Widget build(BuildContext context) {
    final section = sections[currentSectionIndex];
    final question = section['questions'][currentQuestionIndex];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const CatPhoto(),
          const GiraffePhoto(),
          Positioned(
            right: 0,
            left: 0,
            top: context.screenHeight * 0.30,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    height: context.screenHeight * 0.052,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: Text(
                        '${currentSectionIndex + 1}- ${section['title']}',
                        style: Styles.textstyle18,
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    question,
                    textAlign: TextAlign.center,
                    style: Styles.textstyle18,
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          selectedAnswer = true;
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('نعم', style: Styles.textstyle18),
                            CheckContainer(isSelected: selectedAnswer == true),
                          ],
                        ),
                      ),
                      const Gap(10),
                      GestureDetector(
                        onTap: () => setState(() {
                          selectedAnswer = false;
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('لا', style: Styles.textstyle18),
                            CheckContainer(isSelected: selectedAnswer == false),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: CustomButton(
                text: 'التالي',
                borderRadius: BorderRadius.circular(50.r),
                onPressed: _next,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
