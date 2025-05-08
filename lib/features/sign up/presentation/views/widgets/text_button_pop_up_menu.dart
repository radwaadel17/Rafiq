import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextButtonPopUpMenu extends StatelessWidget {
  const TextButtonPopUpMenu({super.key, this.txt, this.ch});
  final String? txt ; 
  final bool? ch ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              )),
          onPressed: null,
          child: Row(
            children: [
              Text(
                txt == null ? (ch == true ? '12:00 صباحاً' : '12:00 مساءً') : txt! ,
                style: Styles.textstyle12.copyWith(color: colorApp),
              ),
              const Spacer(
                flex: 2,
              ),
              SvgPicture.asset(Assets.icons.popupmenuIcon),
              const Spacer(
                flex: 2,
              ),
            ],
          )),
    );
  }
}
