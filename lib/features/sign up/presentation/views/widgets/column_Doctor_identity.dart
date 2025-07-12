import 'dart:io';

import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/conatiner_doctor_identity.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/text_column.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ColumnDoctorIdentity extends StatefulWidget {
  const ColumnDoctorIdentity({
    super.key,
  });

  @override
  State<ColumnDoctorIdentity> createState() => _ColumnDoctorIdentityState();
}

class _ColumnDoctorIdentityState extends State<ColumnDoctorIdentity> {
  File? certificateImage;
  File? selfieImage;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          const TextColumn(
              txt: 'التحقق من الهوية',
              txt2:
                  'ستتم مشاركة معلوماتك مع فريق الخبراء الطبيين لدينا للتحقق من هويتك ك طبيب'),
          SizedBox(
            height: 60.h,
          ),
          ContainerDoctorIdentity(
            imgPath: Assets.images.upload.path,
            txt1: 'التحقق من الهوية',
            txt2: 'شهادة او وثيقة تثبت مزاولتك للمهنة',
            onFilePicked: (file) => certificateImage = file,
          ),
          SizedBox(
            height: 30.h,
          ),
          ContainerDoctorIdentity(
            imgPath: Assets.images.takeSelfi.path,
            txt1: 'صورة سيلفي',
            txt2: 'مطلوب من قبل نظامنا للتحقق من الهوية',
            useCamera: true,
            onFilePicked: (file) => selfieImage = file,
          ),
          const Spacer(flex: 1),
          SizedBox(
              width: context.screenWidth * 0.95,
              child: CustomButton(
                  onPressed: () {
                    if (certificateImage != null && selfieImage != null) {
                      // ✅ لو الصورتين مرفوعين نروح للصفحة التالية
                      GoRouter.of(context)
                          .push(Approuter.doctorManageAppointment);
                    } else {
                      // ❌ لو في صورة ناقصة، نظهر تنبيه
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('من فضلك ارفع صورة الشهادة وصورة السيلفي'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                  text: 'تأكيد')),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
