import 'package:app/core/utlis/device_size.dart';
import 'package:app/features/questions/presentation/views/widgets/ResultContainer.dart';
import 'package:app/features/questions/presentation/views/widgets/custom_button_qs.dart';
import 'package:app/features/questions/presentation/views/widgets/second_res_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Results extends StatelessWidget {
  const Results({
    super.key,
    required this.res,
    required this.probality,
  });
  final String res;
  final double probality;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        top: context.screenHeight * 0.1,
        right: 0,
        left: 0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ResultContainer(),
              Gap(20.h),
              const SecondsResultContainer(
                txt: '👫 التفاعل الاجتماعي واللعب:',
                degree: 0.9,
                probality: 9.1,
                totalDegree: 3.2,
              ),
              Gap(20.h),
              const SecondsResultContainer(
                txt: '🤸‍♂️ النشاط الجسدي:',
                degree: 0.9,
                probality: 9.1,
                totalDegree: 3.2,
              ),
              Gap(20.h),
              const SecondsResultContainer(
                txt: '🗣️ التواصل والانخراط:',
                degree: 0.9,
                probality: 9.1,
                totalDegree: 3.2,
              ),
              Gap(20.h),
              SizedBox(
                width: double.infinity,
                child: CustomButtonQs(txt: 'تحميل التقرير', onPressed: (){})),
              Gap(20.h),
            ],
          ),
        ));
  }
}
