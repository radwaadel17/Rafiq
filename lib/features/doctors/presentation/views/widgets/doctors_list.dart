import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/doctors/presentation/views/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "بعض الإقتراحات",
              style: Styles.textstyle16,
            ),
            Text(
              "المزيد",
              style: Styles.textstyle16,
            ),
          ],
        ),
        const Gap(10),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (_, int index) {
            return const DoctorItem();
          },
          separatorBuilder: (BuildContext context, int index) => const Gap(4),
        ),
      ],
    );
  }
}
