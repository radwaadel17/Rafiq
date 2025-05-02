import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerDoctorIdentity extends StatelessWidget {
  const ContainerDoctorIdentity({
    super.key,
    required this.imgPath,
    required this.txt1,
    required this.txt2,
  });

  final String imgPath;
  final String txt1;
  final String txt2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.22,
      width: context.screenWidth * 0.95,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            txt1,
            style: Styles.textstyle14,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            txt2,
            style: Styles.textstyle12,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(height: 48.h, child: Image.asset(imgPath)),
        ],
      ),
    );
  }
}
