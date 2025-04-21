import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/home/presentation/views/widgets/grid_doctor_item.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PopularDoctorsSection extends StatelessWidget {
  const PopularDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "أشهر الاطباء",
              style: Styles.textstyle18.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "الكل",
              style: Styles.textstyle14,
            )
          ],
        ),
        const Gap(8),
        DynamicHeightGridView(
            itemCount: 4,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            builder: (BuildContext context, int index) {
              return const GridDoctorItem();
            }),
      ],
    );
  }
}
