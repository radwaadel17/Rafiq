import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactDocContainer extends StatelessWidget {
  const ContactDocContainer({super.key, required this.pathPhoto, required this.width, required this.height});
  final String pathPhoto ;
  final double width ;
  final double height ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.r),
      child: Container(
        height: 33.h,
        width: 34.18.w,
       decoration: BoxDecoration(
        color: const Color(0xffB2C3CE),
        borderRadius: BorderRadius.circular(8),
       ),
       child: Center(
         child: SizedBox(
          height: 22.h,
          child: Image.asset(pathPhoto , fit: BoxFit.contain, width: width , height: height,)),
       ),
      ),
    );
  }
}
