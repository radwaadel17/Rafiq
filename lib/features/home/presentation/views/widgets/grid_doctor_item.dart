import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/doctors/domain/entity/doctor_entity.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GridDoctorItem extends StatelessWidget {
  final DoctorModel doctor;

  const GridDoctorItem({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 172,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(Assets.images.doctorAvatar.path),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  style: Styles.textstyle14,
                ),
                const Gap(8),
                Text(
                  doctor.specialization,
                  style: Styles.textstyle14,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
