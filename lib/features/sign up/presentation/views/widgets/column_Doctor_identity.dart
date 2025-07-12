import 'dart:io';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/features/sign%20up/presentation/views/doctor_manage_appoinment.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/conatiner_doctor_identity.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/text_column.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnDoctorIdentity extends StatefulWidget {
  const ColumnDoctorIdentity({super.key, required this.user});
  final UserSignupDoctorEntity user;
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
            onFilePicked: (file) {
              setState(() {
                certificateImage = file;
                widget.user.identityVerification =file.path;
              });
            }
          ),
          SizedBox(
            height: 30.h,
          ),
          ContainerDoctorIdentity(
            imgPath: Assets.images.takeSelfi.path,
            txt1: 'صورة سيلفي',
            txt2: 'مطلوب من قبل نظامنا للتحقق من الهوية',
            useCamera: true,
            onFilePicked: (file) {
              setState(() {
                selfieImage = file;
                widget.user.selfiePhoto =file.path;
              });
            },
          ),
          const Spacer(flex: 1),
          SizedBox(
              width: context.screenWidth * 0.95,
              child: CustomButton(
                
                  onPressed: () {
                    if (certificateImage != null && selfieImage != null) {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return DoctorAppointmentsView(user: widget.user,);
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      print(widget.user.identityVerification);
                      print(widget.user.selfiePhoto);
                    } else {
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
