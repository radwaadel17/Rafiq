import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_app_bar.dart';
import 'package:app/features/Doctor%20Book/presentation/views/widgets/row_of_book_date_containers.dart';
import 'package:app/features/Doctor%20Book/presentation/views/widgets/row_of_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookViewBody extends StatelessWidget {
  const BookViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(txt: 'تفاصيل الحجز'),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'اختار التاريخ والمعاد المناسب',
            style: Styles.textstyle18.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        const RowOfBookDateContainers(),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'نوع الحجز',
            style: Styles.textstyle18.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
         SizedBox(
          height: 10.h,
        ),
      const Buttons()
      ],
    );
  }

}
