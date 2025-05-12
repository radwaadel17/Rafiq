import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMinusContainer extends StatelessWidget {
  const AddMinusContainer({
    super.key,
    required this.icon,
    required this.color, this.onTap,
  });
  final IconData icon;
  final Color color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: GestureDetector(
        onTap: onTap , 
        child: Container(
          width: 30.w,
          height: 30.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
