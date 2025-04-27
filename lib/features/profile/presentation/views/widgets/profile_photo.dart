import 'package:app/core/utlis/device_size.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(150.r),
          child: Image.asset(
            Assets.images.userAvatar.path,
            fit: BoxFit.contain,
            height: context.screenHeight * 0.20,
          )),
        Positioned(
          bottom: 0,
          child: SizedBox(
            height: context.screenHeight * 0.05,
            child: Image.asset(Assets.images.editIcon.path)),
        )
      ],
    );
  }
}
