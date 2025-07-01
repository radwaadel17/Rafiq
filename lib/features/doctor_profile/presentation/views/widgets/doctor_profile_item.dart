import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DoctorProfileItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTap;
  const DoctorProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  color: colorApp,
                ),
                const Gap(8),
                Text(
                  title,
                  style: Styles.textstyle18,
                )
              ],
            ),
            SvgPicture.asset(
              Assets.icons.forwardArrow,
            ),
          ],
        ),
      ),
    );
  }
}
