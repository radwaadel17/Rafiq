import 'package:app/features/Doctor%20Book/presentation/views/widgets/book_type_bottun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child:  const Column(
        children: [
           Row(
            children: [
              BookTypeButton(txt: 'اونلاين'),
              BookTypeButton(txt: 'في العيادة')
            ],
          ),

        ],
      ),
    );
  }
}
