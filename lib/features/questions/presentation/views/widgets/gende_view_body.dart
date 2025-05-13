import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/screens/origin.dart';
import 'package:app/features/questions/presentation/views/widgets/addtional_info_container.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/custom_button_qs.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/pop_up_menu_gender.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GenderViewBody extends StatefulWidget {
  const GenderViewBody({super.key, required this.qsEntity});
  final QsEntity qsEntity;

  @override
  State<GenderViewBody> createState() => _GenderViewBodyState();
}

class _GenderViewBodyState extends State<GenderViewBody> {
  List<PopupMenuItem<String>> genderMenuItems = [
    PopupMenuItem(
      value: 'ذكر',
      child: Text('ذكر', style: Styles.textstyle14),
    ),
    PopupMenuItem(
      value: 'انثى',
      child: Text('انثى', style: Styles.textstyle14),
    ),
  ];
  String? txt;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CatPhoto(),
        const GiraffePhoto(),
        Positioned(
            right: 0,
            left: 0,
            top: context.screenHeight * 0.33,
            child: Column(
              children: [
                const AddtionalInfoContainer(),
                const Gap(20),
                Text(
                  '👶🏻 الجنس',
                  style: Styles.textstyle20,
                ),
                PopUpMenuGender(
                  genderMenuItems: genderMenuItems,
                  onSelected: (value) {
                    txt = value;
                  },
                ),
              ],
            )),
        CustomButtonQs(
            txt: 'التالي',
            onPressed: () {
              widget.qsEntity.relation = txt;
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return OrginView(qsEntity: widget.qsEntity);
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
            })
      ],
    );
  }
}
