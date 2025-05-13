import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextButtonPopUpMenuGender extends StatelessWidget {
  const TextButtonPopUpMenuGender({super.key, this.txt, this.ch});
  final String? txt ; 
  final bool? ch ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              )),
          onPressed: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(

                txt!=null ? txt! : 'الجنس' ,
                style: Styles.textstyle18.copyWith(color: colorApp),
                 overflow: TextOverflow.ellipsis,
                 maxLines: 1,
              ),
             
              SvgPicture.asset(Assets.icons.popupmenuIcon),
             
            ],
          )),
    );
  }
}