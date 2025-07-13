import 'package:app/core/utlis/device_size.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DoctorPhotoContainer extends StatelessWidget {
  const DoctorPhotoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.32,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(140),
        ),
        child: Image(
          image: AssetImage(
            Assets.images.doctorAvatar.path,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
