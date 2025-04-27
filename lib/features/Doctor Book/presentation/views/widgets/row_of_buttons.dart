import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/Doctor%20Book/presentation/views/widgets/book_type_bottun.dart';
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
      child: Column(
        children: [
          Row(
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
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isSelected != null
                ? Padding(
                    key: ValueKey(isSelected),
                    padding: EdgeInsets.only(top: 16.h),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            children: [
                              Text(
                                'سعر الكشف',
                                style: Styles.textstyle16,
                              ),
                              const Spacer(),
                              isSelected == 0
                                  ? Text(
                                      '400',
                                      style: Styles.textstyle16,
                                    )
                                  : Text(
                                      '600',
                                      style: Styles.textstyle16,
                                    )
                            ],
                          ),
                        )),
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
