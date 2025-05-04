import 'package:app/core/widgets/book_type_bottun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttons extends StatefulWidget {
  const Buttons({
    super.key,
  });

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  int? isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          BookTypeButton(
            isSelected: isSelected == 0,
            txt: 'اونلاين',
            onPressed: () {
              setState(() {
                isSelected = 0;
              });
            },
          ),
          BookTypeButton(
              isSelected: isSelected == 1,
              onPressed: () {
                setState(() {
                  isSelected = 1;
                });
              },
              txt: 'في العيادة'),
        ],
      ),
    );
  }
}
