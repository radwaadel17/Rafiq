import 'package:app/core/utlis/constants.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RondedStarContainer extends StatelessWidget {
  const RondedStarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: SvgPicture.asset(
        Assets.icons.roundedStar,
        height: 12.h,
      )),
    );
  }
}