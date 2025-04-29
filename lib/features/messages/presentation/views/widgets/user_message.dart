import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        height: 60.h,
        width: context.screenWidth * 0.98,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w ,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image(
                    image: AssetImage(
                      Assets.images.doctorImage.path,
                    ),
                    height: 60.h,
                    width: 60.w,
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "د.محمد اياد",
                  style: Styles.textstyle16,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'من حوالي 3 شهور ',
                      style: Styles.textstyle12.copyWith(color: textFieldColor),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      '1س',
                      style: Styles.textstyle12.copyWith(color: textFieldColor),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            SvgPicture.asset(Assets.icons.readSign),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
