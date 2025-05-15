import 'package:app/core/utlis/device_size.dart';
import 'package:app/features/questions/domain/entity/result_entity.dart';
import 'package:app/features/questions/presentation/manager/result_cubit.dart';
import 'package:app/features/questions/presentation/manager/result_states.dart';
import 'package:app/features/questions/presentation/views/widgets/ResultContainer.dart';
import 'package:app/features/questions/presentation/views/widgets/custom_button_qs.dart';
import 'package:app/features/questions/presentation/views/widgets/second_res_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Results extends StatelessWidget {
  const Results({
    super.key,
    required this.resultEntity,
  });
  final ResultEntity resultEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultCubit, ResultStates>(
      builder: (context, state) {
        return Positioned.fill(
            top: context.screenHeight * 0.1,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ResultContainer(
                    prediction: resultEntity.prediction,
                    precentage: resultEntity.probability,
                  ),
                  Gap(20.h),
                  SecondsResultContainer(
                    txt: '👫 التفاعل الاجتماعي واللعب:',
                    degree: resultEntity.commScore,
                    probality: resultEntity.commPecentage,
                    totalDegree: resultEntity.commTotal,
                  ),
                  Gap(20.h),
                  SecondsResultContainer(
                    txt: '🤸‍♂️ النشاط الجسدي:',
                    degree: resultEntity.physicalScore,
                    probality: resultEntity.physicalPecentage,
                    totalDegree: resultEntity.physicalTotal,
                  ),
                  Gap(20.h),
                  SecondsResultContainer(
                    txt: '🗣️ التواصل والانخراط:',
                    degree: resultEntity.socialScore,
                    probality: resultEntity.socialPecentage,
                    totalDegree: resultEntity.socialTotal,
                  ),
                  Gap(20.h),
                  SizedBox(
                      width: double.infinity,
                      child: CustomButtonQs(
                          txt: 'تحميل التقرير', onPressed: () {})),
                  Gap(20.h),
                ],
              ),
            ));
      },
    );
  }
}
