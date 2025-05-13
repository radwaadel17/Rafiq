import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/widgets/addtional_info_container.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/custom_button_qs.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/text_button_pop_up_menu_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CountryViewBody extends StatefulWidget {
  const CountryViewBody({super.key, required this.qsEntity});
  final QsEntity qsEntity ;
  @override
  State<CountryViewBody> createState() => _CountryViewBodyState();
}

class _CountryViewBodyState extends State<CountryViewBody> {
  final List<String> residenceOption = [
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
    residenceMenuItems = residenceOption
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
                  "بلد الإقامة",
                  style: Styles.textstyle20,
                ),
                const Gap(20),
                PopupMenuButton(
                  itemBuilder: (context) => residenceMenuItems,
                  offset: const Offset(-100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  onSelected: (value) {
                    setState(() {
                      txt = value;
                    });
                  },
                  color: Colors.white,
                  child: TextButtonPopUpMenuCountry(
                    txt: txt,
                  ),
                )
              ],
            )),
        CustomButtonQs(
          txt: 'توقــــع',
          onPressed: () {
             widget.qsEntity.residence = txt;
             
            /* Navigator.push(
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
            ); */
          },
        ),
      ],
    );
  }
}
