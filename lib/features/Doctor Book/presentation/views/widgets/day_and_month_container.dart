import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayAndMonthContainer extends StatelessWidget {
  const DayAndMonthContainer({super.key, required this.txt});
  final String txt ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        width: context.screenWidth * 0.25,
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Text(
              txt,
              style: Styles.textstyle18,
            ),
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Text(
                  '25',
                  style: Styles.textstyle18,
                )),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}