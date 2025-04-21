import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class GridDoctorItem extends StatelessWidget {
  const GridDoctorItem({
    super.key,
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
              image: AssetImage(Assets.images.doctorImage.path),
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
                  "د.محمد إياد",
                  style: Styles.textstyle14,
                ),
                const Gap(8),
                Text(
                  "أخصائي تخاطب",
                  style: Styles.textstyle14,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "4.9",
                  style: Styles.textstyle14,
                ),
                const Gap(5),
                SvgPicture.asset(
                  Assets.icons.roundedStar,
                  height: 16,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
