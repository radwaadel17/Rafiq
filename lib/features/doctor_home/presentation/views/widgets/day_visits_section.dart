// ignore_for_file: deprecated_member_use

import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DayVisitsSection extends StatefulWidget {
  const DayVisitsSection({
    super.key,
  });

  @override
  State<DayVisitsSection> createState() => _DayVisitsSectionState();
}

class _DayVisitsSectionState extends State<DayVisitsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "زيارات اليوم ",
          style: Styles.textstyle18,
        ),
        const Gap(16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: colorApp,
                      ),
                    ),
                    const Gap(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "محمد أحمد ",
                          style: Styles.textstyle16,
                        ),
                        const Gap(4),
                        Text(
                          "من 3:00 - 3:30 مساءً",
                          style: Styles.textstyle12,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(Assets.images.phone),
                    const Gap(16),
                    SvgPicture.asset(
                      Assets.icons.chat,
                      color: successColor,
                    ),
                    const Gap(16),
                    SvgPicture.asset(Assets.images.close),
                  ],
                )
              ],
            );
          },
          separatorBuilder: (_, int index) => const Gap(20),
          itemCount: 4,
        ),
      ],
    );
  }
}
