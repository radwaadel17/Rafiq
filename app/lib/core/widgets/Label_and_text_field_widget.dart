import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelAndTextField extends StatelessWidget {
  const LabelAndTextField({super.key, required this.text, required this.hintText, this.controller, this.onChanged} );
   final String text ;
   final String hintText ;
   final TextEditingController? controller ;
   final Function(String)? onChanged ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextArabicWithStyle(
              text: text,
              textsyle:
                  Styles.textstyle18.copyWith(fontWeight: FontWeight.normal)),
          TextFormField(
            
            obscureText: false ,
            
            onChanged: onChanged,
            controller: controller,
            validator: (value){
              if(value?.isEmpty ?? true){
              return 'This field is required';
              }
              else {
                return null ;
              }
            },
            
            textAlign: TextAlign.right, 
            textDirection: TextDirection.rtl, 
            decoration: InputDecoration(
            
              
              hintText: hintText, 
              hintStyle: TextStyle(
                  color: Colors.grey, fontSize: 16.sp), 
              filled: true, 
              fillColor: Colors.grey[200], 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r), 
                borderSide: BorderSide.none, 
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w, vertical: 16.h), 
            ),
            
          )
        ],
      ),
    );
  }
}
