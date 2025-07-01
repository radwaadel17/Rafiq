import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DoctorProfileHeader extends StatelessWidget {
  const DoctorProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: SvgPicture.asset(Assets.icons.logout),
        ),
        const Gap(16),
        Center(
          child: Stack(
            children: [
              Image.asset(
                Assets.images.userAvatar.path,
                height: 170,
              ),
              Positioned(
                bottom: 10,
                right: 15,
                child: SvgPicture.asset(Assets.icons.edit),
              ),
            ],
          ),
        ),
        const Gap(10),
        Text(
          "د.إياد أحمد",
          style: Styles.textstyle18,
        ),
        Text(
          "Eyad_Ahmed@gmail.com",
          style: Styles.textstyle16.copyWith(
            color: disabledColor,
          ),
        )
      ],
    );
  }
}
