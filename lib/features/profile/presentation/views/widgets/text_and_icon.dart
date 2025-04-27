import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextAndIcon extends StatelessWidget {
  const TextAndIcon({
    super.key, required this.txt, required this.imagePath,
  });
  final String txt ;
  final String imagePath ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          SvgPicture.asset(imagePath ),
          const  Spacer(flex: 1,),
          Text(txt , style: Styles.textstyle18,),
          const  Spacer(flex: 20,),
          SvgPicture.asset(Assets.icons.vector)
        ],
      ),
    );
  }
}