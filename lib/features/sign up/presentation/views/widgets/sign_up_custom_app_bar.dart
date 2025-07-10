import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpCustomAppBar extends StatelessWidget {
  const SignUpCustomAppBar({super.key, required this.imgPath});
   final String imgPath ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.9,
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h, top: 24.h),
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 12.h,
              child: Image.asset(AppImages.blueArrowBack),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: SizedBox(
                  height: 8.h, child: Image.asset(imgPath)),
            ),
          ],
        )),
      ),
    );
  }
}


