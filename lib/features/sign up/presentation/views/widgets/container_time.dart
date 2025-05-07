import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerTime extends StatefulWidget {
  const ContainerTime({
    super.key,
    required this.txt,
    this.onPressed,
    required this.selectedIndex,
  });
  final String txt;
  final void Function()? onPressed;
  final bool selectedIndex;

  @override
  State<ContainerTime> createState() => _ContainerTimeState();
}

class _ContainerTimeState extends State<ContainerTime> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.05,
      width: context.screenWidth * 0.3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: TextButton(
            onPressed: widget.onPressed,
            style: TextButton.styleFrom(
                backgroundColor:
                    widget.selectedIndex == false ? secondaryColor : greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                )),
            child: Text(
              widget.txt,
              style: Styles.textstyle12.copyWith(
                  color:
                      widget.selectedIndex == false ? greyColor : Colors.white),
            )),
      ),
    );
  }
}
