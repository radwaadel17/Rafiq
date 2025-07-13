import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/app_button.dart';
import 'package:app/features/doctors/domain/entity/doctor_entity.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DoctorItem extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorItem({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.images.doctorAvatar.path),
                      ),
                    ),
                  ),
                  const Gap(6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: Styles.textstyle14,
                      ),
                      const Gap(4),
                      SizedBox(
                        width: 200,
                        child: Text(
                          doctor.specialization,
                          style: Styles.textstyle14,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: AppButton(
            height: 38,
            onTap: () {
              GoRouter.of(context).pushNamed(
                'doctorDetails',
                extra: doctor,
              );
            },
            text: "تفاصيل",
          ),
        )
      ],
    );
  }
}
