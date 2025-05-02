import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/conatiner_doctor_identity.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnDoctorIdentity extends StatelessWidget {
  const ColumnDoctorIdentity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          Text(
            'التحقق من الهوية',
            style: Styles.textstyle18,
          ),
          SizedBox(
              width: context.screenWidth * 0.80,
              child: Text(
                'ستتم مشاركة معلوماتك مع فريق الخبراء الطبيين لدينا للتحقق من هويتك ك طبيب',
                style: Styles.textstyle12,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 60.h,
          ),
          ContainerDoctorIdentity(
            imgPath: Assets.images.upload.path,
            txt1: 'التحقق من الهوية',
            txt2: 'شهادة او وثيقة تثبت مزاولتك للمهنة',
          ),
          SizedBox(
            height: 30.h,
          ),
          ContainerDoctorIdentity(
              imgPath: Assets.images.takeSelfi.path,
              txt1: 'صورة سيلفي',
              txt2: 'مطلوب من قبل نظامنا للتحقق من الهوية'),
          const Spacer(flex: 1),
          SizedBox(
              width: context.screenWidth * 0.95,
              child: const CustomButton(text: 'تأكيد')),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
