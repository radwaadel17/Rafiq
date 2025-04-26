import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/home/presentation/views/widgets/rounded_star_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameAndSpecifyofDoc extends StatelessWidget {
  const NameAndSpecifyofDoc({
    super.key,
    required this.name,
    required this.sp,
  });
  final String name;
  final String sp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:  32.w, right: 16.w) ,
      child: Row(
        children: [
          Column(
            children: [
              Text(
                name,
                style: Styles.textstyle18.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                sp,
                style: Styles.textstyle16,
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const Spacer(flex: 1,),
          Column(
            children: [
              const RondedStarContainer(),
              Text(
                '4.5',
                style: Styles.textstyle12.copyWith(color: colorApp),
              ),
          

            ],
          ),
        ],
      ),
    );
  }
}