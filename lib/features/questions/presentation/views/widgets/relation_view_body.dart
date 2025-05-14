import 'package:another_flushbar/flushbar.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/screens/question_two_screen.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/custom_button_qs.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/text_button_pop_up_menu_relation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RelationViewBody extends StatefulWidget {
  const RelationViewBody({super.key, required this.qsEntity});
  final QsEntity qsEntity;

  @override
  State<RelationViewBody> createState() => _RelationViewBodyState();
}

class _RelationViewBodyState extends State<RelationViewBody> {
  final List<String> relationOptions = [
    'أخصائي رعاية صحية',
    'ذاتي',
    'قريب',
    'غير معروف',
    'والد/والدة',
  ];

  late List<PopupMenuItem<String>> relationMenuItems;

  @override
  void initState() {
    super.initState();
    relationMenuItems = [
      for (var option in relationOptions)
        PopupMenuItem<String>(
          value: option,
          child: Text(
            option,
            style: Styles.textstyle14,
          ),
        ),
    ];
  }

  String? txt;
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
                  'حدد علاقتك للصغير',
                  style: Styles.textstyle20,
                ),
                const Gap(20),
                PopupMenuButton(
                  offset: const Offset(-100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  onSelected: (value) {
                    setState(() {
                      txt = value;
                    });
                  },
                  itemBuilder: (context) => relationMenuItems,
                  color: Colors.white,
                  child: TextButtonPopUpMenuRelation(
                    txt: txt,
                  ),
                )
              ],
            )),
        CustomButtonQs(
          txt: 'التالي',
          onPressed: () {
            if (txt == null) {
              Flushbar(
                backgroundColor: Colors.red,
                messageText: Text(
                  'برجاء اختيار العلاقة قبل الانتقال الى الاسئلة',
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
            widget.qsEntity.relation = txt;
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return QuestionTwoScreen(qsEntity: widget.qsEntity);
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
        ),
      ],
    );
  }
}
