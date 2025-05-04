import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({
    super.key, required this.txt,
  });
  final String txt ;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Text(
          txt ,
          style: Styles.textstyle18,
        ),
      ),
    );
  }
}

