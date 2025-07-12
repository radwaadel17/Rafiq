import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_app_bar.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/Doctor%20Book/presentation/views/widgets/row_of_book_date_containers.dart';
import 'package:app/features/Doctor%20Book/presentation/views/widgets/row_of_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookViewBody extends StatefulWidget {
  const BookViewBody({super.key});

  @override
  State<BookViewBody> createState() => _BookViewBodyState();
}

class _BookViewBodyState extends State<BookViewBody> {


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
        const Buttons(),
        SizedBox(
          height: 10.h,
        ),
        Center(
          child: SizedBox(
              width: context.screenWidth * 0.90,
              child: CustomButton(
                  onPressed: () {
                 GoRouter.of(context).push(Approuter.paymentPage);
                  },
                  text: 'اكمال الدفع')),
        )
      ],
    );
  }
}
//
