import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/screens/addtional_qs.dart';
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
  final List<String> residenceOptions = [
    'أستراليا',
    'أفغانستان',
    'أوروبا',
    'إيطاليا',
    'الأردن',
    'الأرجنتين',
    'الإمارات العربية المتحدة',
    'البحرين',
    'البرازيل',
    'السويد',
    'الصين',
    'العراق',
    'الكويت',
    'المكسيك',
    'المملكة العربية السعودية',
    'المملكة المتحدة',
    'النمسا',
    'اليابان',
    'باكستان',
    'بنغلاديش',
    'بوتان',
    'تركيا',
    'جزر الولايات المتحدة النائية',
    'جزيرة مان',
    'جورجيا',
    'روسيا',
    'رومانيا',
    'سوريا',
    'جنوب إفريقيا',
    'غانا',
    'قطر',
    'كندا',
    'كوريا الجنوبية',
    'كوستاريكا',
    'لاتفيا',
    'لبنان',
    'ليبيا',
    'مالطا',
    'ماليزيا',
    'مصر',
    'نيبال',
    'نيوزيلندا',
    'هولندا',
    'الولايات المتحدة',
    'عمان',
    'الفلبين'
  ];

  late List<PopupMenuItem<String>> residenceMenuItems;
  @override
  initState() {
    super.initState();
    residenceMenuItems = residenceOptions
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
                Text(
                  'العرق / الاأصل الجغرافي',
                  style: Styles.textstyle20,
                ),
                const Gap(20),
                PopupMenuButton<String>(
                    color: Colors.white,
                    onSelected: (value) => setState(() {
                          txt = value;
                          // print('Current selected value: $txt');
                        }),
                    itemBuilder: (context) => residenceMenuItems,
                    offset: const Offset(-100, 50),
                    child: TextButtonPopUpMenuOrigin(txt: txt)),
              ],
            )),
        CustomButtonQs(
            txt: 'التالي',
            onPressed: () {
              widget.qsEntity.residence = txt;
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return AddtionalQsView(qsEntity: widget.qsEntity);
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
