import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final double? height;
  final double? width;
  final double? borderRadius;
  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 48,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: colorApp,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.textstyle14.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
