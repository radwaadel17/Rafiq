import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';

class OtpBoxConatiner extends StatelessWidget {
  const OtpBoxConatiner({
    super.key, required this.numebr,
  });
  final String numebr;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: context.screenHeight * 0.07,
        child: AspectRatio(
          aspectRatio: 6.7 / 10,
          child: Container(
            decoration: BoxDecoration(
              color:const Color(0xffADC5FF).withOpacity(0.49),
              borderRadius: BorderRadius.circular(9),
              border: const Border(bottom: BorderSide(
                color: Color(0xffADC5FF),
                width: 4.0
              )),
            ),
            child: Center(child: Text(numebr ,style: Styles.textstyle18.copyWith(fontWeight: FontWeight.normal),) ),
            ),
        ),
      ),
    );
  }
}