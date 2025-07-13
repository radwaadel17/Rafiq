import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/doctors/domain/entity/doctor_entity.dart';
import 'package:app/features/home/presentation/views/widgets/container_text.dart';
import 'package:app/features/home/presentation/views/widgets/name_and_sp_doc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorInfo extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorInfo({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameAndSpecifyofDoc(
          name: doctor.name,
          sp: doctor.specialization,
        ),
        SizedBox(
          height: 8.h,
        ),
        ContainerText(
          txt: doctor.appointments.map((e) => 'من ${e.day} (${e.morning} : ${e.evening} مساءً)').join(","),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          width: context.screenWidth * 0.93,
          child: Text(doctor.description,
              textAlign: TextAlign.right, // يخلي الكتابة من اليمين لليسار
              style: Styles.textstyle12.copyWith(color: colorApp)),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
            width: context.screenWidth * 0.7,
            child: CustomButton(
              text: 'حجز',
              onPressed: () {
                GoRouter.of(context).push(Approuter.doctorBook);
              },
            ))
      ],
    );
  }
}
