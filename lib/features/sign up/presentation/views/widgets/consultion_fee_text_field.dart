import 'package:app/core/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsultionFeeTextField extends StatelessWidget {
  const ConsultionFeeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: secondaryColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16), // الزوايا المدورة
              borderSide: BorderSide.none, // بدون حدود
            ),
          ),
        ),
      ),
    );
  }
}