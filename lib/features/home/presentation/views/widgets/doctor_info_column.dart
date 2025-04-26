import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/home/presentation/views/widgets/container_text.dart';
import 'package:app/features/home/presentation/views/widgets/name_and_sp_doc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NameAndSpecifyofDoc(
          name: 'د محمد اياد',
          sp: 'طبيب أطفال',
        ),
        SizedBox(
          height: 8.h,
        ),
        const ContainerText(
          txt: 'من ألاحد - الخميس (7:00 : 10:00 مساء )',
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          width: context.screenWidth * 0.93,
          child: Text(
              'أخصائي طب الأطفال وحديثي الولادة\n\n'
              'خبرة واسعة في تشخيص وعلاج أمراض الأطفال، مع متابعة\n\n'
              'دقيقة لنموهم وصحتهم. يقدم استشارات متكاملة حول التغذية، \n\n'
              'التطعيمات، والرعاية الوقائية لضمان صحة وسلامة الأطفال\n\n'
              '📍 العيادة: ٢ شارع الزهور، منطقة النخيل، الإسماعيلية',
              textAlign: TextAlign.right, // يخلي الكتابة من اليمين لليسار
              style: Styles.textstyle12.copyWith(color: colorApp)),
        ),
        SizedBox(
          height: 8.h,
        ),
       SizedBox(
        width: context.screenWidth*0.9,
        child: const CustomButton(text: 'حجز'))
      ],
    );
  }
}