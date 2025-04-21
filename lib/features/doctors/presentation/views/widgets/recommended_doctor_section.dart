import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/app_button.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RecommendedDoctorSection extends StatelessWidget {
  const RecommendedDoctorSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorApp.withOpacity(0.38),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "نرشح لك",
              style: Styles.textstyle18,
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Assets.images.doctorImage.path),
                        ),
                      ),
                    ),
                    const Gap(6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "د.علي إبراهيم",
                          style: Styles.textstyle14,
                        ),
                        const Gap(4),
                        Text(
                          "طبيب أطفال",
                          style: Styles.textstyle14,
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(Assets.icons.outlineStar),
                    const Gap(4),
                    Text(
                      "4.5",
                      style: Styles.textstyle12.copyWith(
                        color: colorApp,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Gap(10),
            AppButton(
              onTap: () {},
              text: "المزيد من التفاصيل",
              height: 35,
            )
          ],
        ),
      ),
    );
  }
}
