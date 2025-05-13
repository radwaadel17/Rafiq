import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/screens/country_view.dart';
import 'package:app/features/questions/presentation/views/widgets/addtional_info_container.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/check_container.dart';
import 'package:app/features/questions/presentation/views/widgets/custom_button_qs.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AddtionalQsBody extends StatefulWidget {
  const AddtionalQsBody({super.key, required this.qsEntity});
  final QsEntity qsEntity;

  @override
  State<AddtionalQsBody> createState() => _AddtionalQsBodyState();
}

class _AddtionalQsBodyState extends State<AddtionalQsBody> {
  final List<String> addtionalQs = [
    "هل عانى من الصفراء عند الولادة؟",
    "هل يوجد تاريخ عائلي مع التوحد؟",
  ];
  List<bool> ans = [];
  int selectIndex = 0;
  bool? selectedAnswer;
  @override
  void initState() {
    super.initState();
    ans = List<bool>.filled(addtionalQs.length, false);
  }

  void next() {
    if (selectedAnswer != null) {
      ans[selectIndex] = selectedAnswer!;
    }
    if (selectIndex < addtionalQs.length - 1) {
      setState(() {
        selectIndex++;
        selectedAnswer = null;
      });
    } else {
      widget.qsEntity.disease = ans[0];
      widget.qsEntity.haveHisory = ans[1];
      Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return CountryView(qsEntity: widget.qsEntity);
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CatPhoto(),
        const GiraffePhoto(),
        Positioned(
          left: 0,
          right: 0,
          top: context.screenHeight * 0.30,
          child: Column(
            children: [
              const AddtionalInfoContainer(),
              const Gap(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  addtionalQs[selectIndex],
                  textAlign: TextAlign.center,
                  style: Styles.textstyle18,
                ),
              ),
              const Gap(10),
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
              ),
            ],
          ),
        ),
        CustomButtonQs(
            txt: 'التالي',
            onPressed: () {
              next();
            }),
      ],
    );
  }
}
