import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DoctorHomeHeader extends StatelessWidget {
  const DoctorHomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                Assets.images.userAvatar.path,
                height: 38,
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "أهلاً،\nدكتور إياد",
                    style: Styles.textstyle14,
                  ),
                ],
              )
            ],
          ),
          SvgPicture.asset(Assets.icons.notificationsOn)
        ],
      ),
    );
  }
}
