import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DayAndMonthContainer extends StatefulWidget {
  const DayAndMonthContainer({super.key, required this.txt});
  final String txt;

  @override
  State<DayAndMonthContainer> createState() => _DayAndMonthContainerState();
}

class _DayAndMonthContainerState extends State<DayAndMonthContainer> {
  String selectedValue = '25'; // Default

/*   void _pickDate() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      onConfirm: (date) {
        setState(() {
          selectedValue = widget.txt == 'يوم'
              ? date.day.toString()
              : date.month.toString();
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.ar,
    );
  } */

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: InkWell(
        onTap:(){},
        child: Container(
          width: context.screenWidth * 0.25,
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              const Spacer(flex: 1),
              Text(widget.txt, style: Styles.textstyle18),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text(
                    selectedValue,
                    style: Styles.textstyle18,
                  )),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
