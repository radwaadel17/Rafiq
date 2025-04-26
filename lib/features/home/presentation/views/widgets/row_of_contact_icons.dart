import 'package:app/features/home/presentation/views/widgets/contact_icon.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowOfContactIcons extends StatelessWidget {
  const RowOfContactIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContactDocContainer(pathPhoto: Assets.images.vector2.path, width:14.18.w, height: 17.32.h,),
        ContactDocContainer(pathPhoto: Assets.images.group.path , width: 14.5.w , height: 9.41,),
        ContactDocContainer(pathPhoto: Assets.images.vector.path , width: 14.w, height: 13.h,),
    
      ],
    );
  }
}