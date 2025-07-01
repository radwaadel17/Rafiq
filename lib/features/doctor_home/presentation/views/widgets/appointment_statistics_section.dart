import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AppointmentStatisticsSection extends StatelessWidget {
  const AppointmentStatisticsSection({
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
              "إحصائيات المواعيد",
              style: Styles.textstyle18,
            ),
            Row(
              children: [
                Text(
                  "اخر 3 شهور",
                  style: Styles.textstyle18.copyWith(
                    color: activeColor,
                  ),
                ),
                const Gap(16),
                SvgPicture.asset(Assets.icons.arrowDown)
              ],
            )
          ],
        ),
        const Gap(16),
        const Row(
          children: [
            AppointmentStatisticsItem(
              title: "الكل",
              number: 760,
              color: activeColor,
              percent: "+22",
            ),
            AppointmentStatisticsItem(
              title: "اونلاين",
              number: 494,
              color: accentColor,
              percent: "+12",
            ),
            AppointmentStatisticsItem(
              title: "في العيادة",
              number: 150,
              color: activeColor,
              percent: "+30",
            ),
          ],
        )
      ],
    );
  }
}

class AppointmentStatisticsItem extends StatelessWidget {
  final String title;
  final Color color;
  final num number;
  final String percent;
  const AppointmentStatisticsItem({
    super.key,
    required this.title,
    required this.color,
    required this.number,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.textstyle18.copyWith(
                color: hintColor,
              ),
            ),
            const Gap(6),
            Row(
              children: [
                Text(
                  "$number",
                  style: Styles.textstyle18.copyWith(
                    color: Colors.black,
                  ),
                ),
                const Gap(16),
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    child: Text(
                      "$percent%",
                      style: Styles.textstyle8,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
