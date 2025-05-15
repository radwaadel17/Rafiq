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

class Results extends StatefulWidget {
  const Results({
    super.key,
    required this.resultEntity,
  });
  final ResultEntity resultEntity;

  @override
  // ignore: library_private_types_in_public_api
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Fade Animation: from 0 (invisible) to 1 (fully visible)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Slide Animation: slight upward slide
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2), // Start slightly below
      end: Offset.zero, // End at original position
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultCubit, ResultStates>(
      builder: (context, state) {
        return Positioned.fill(
          top: context.screenHeight * 0.1,
          right: 0,
          left: 0,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ResultContainer(
                      prediction: widget.resultEntity.prediction,
                      precentage: widget.resultEntity.probability,
                    ),
                    Gap(20.h),
                    SecondsResultContainer(
                      txt: '👫 التفاعل الاجتماعي واللعب:',
                      degree: widget.resultEntity.commScore,
                      probality: widget.resultEntity.commPecentage,
                      totalDegree: widget.resultEntity.commTotal,
                    ),
                    Gap(20.h),
                    SecondsResultContainer(
                      txt: '🤸‍♂️ النشاط الجسدي:',
                      degree: widget.resultEntity.physicalScore,
                      probality: widget.resultEntity.physicalPecentage,
                      totalDegree: widget.resultEntity.physicalTotal,
                    ),
                    Gap(20.h),
                    SecondsResultContainer(
                      txt: '🗣️ التواصل والانخراط:',
                      degree: widget.resultEntity.socialScore,
                      probality: widget.resultEntity.socialPecentage,
                      totalDegree: widget.resultEntity.socialTotal,
                    ),
                    Gap(20.h),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButtonQs(
                        txt: 'تحميل التقرير',
                        onPressed: () {},
                      ),
                    ),
                    Gap(20.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}