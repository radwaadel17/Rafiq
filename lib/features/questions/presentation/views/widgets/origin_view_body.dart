import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/screens/country_view.dart';
import 'package:app/features/questions/presentation/views/widgets/addtional_info_container.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/custom_button_qs.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/text_button_pop_up_menu_origin.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OriginViewBody extends StatefulWidget {
  const OriginViewBody({super.key, required this.qsEntity});
  final QsEntity qsEntity;

  @override
  State<OriginViewBody> createState() => _OriginViewBodyState();
}

class _OriginViewBodyState extends State<OriginViewBody> {
  final List<String> ethnicityOptions = [
   'آسيوي',
  'أفريقي',
  'أوروبي',
  'تركي',
  'جزر المحيط الهادئ',
  'جنوب آسيوي',
  'عربي',
  'غير معروف',
  'لاتيني'
  ];

  late List<PopupMenuItem<String>> ethnicityMenuItems;
  @override
  initState() {
    super.initState();
    ethnicityMenuItems = ethnicityOptions
        .map((String option) => PopupMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: Styles.textstyle14,
              ),
            ))
        .toList();
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
                  const AddtionalInfoContainer(),
                  const Gap(20),
                Text(
                  'العرق / الاأصل الجغرافي',
                  style: Styles.textstyle20,
                ),
                const Gap(10),
                PopupMenuButton<String>(
                    color: Colors.white,
                    onSelected: (value) => setState(() {
                          txt = value;
                          // print('Current selected value: $txt');
                        }),
                    itemBuilder: (context) => ethnicityMenuItems,
                    offset: const Offset(-100, 50),
                    child: TextButtonPopUpMenuOrigin(txt: txt)),
              ],
            )),
        CustomButtonQs(
            txt: 'التالي',
            onPressed: () {
              widget.qsEntity.ethnicity = txt;
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
            })
      ],
    );
  }
}
