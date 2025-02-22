import 'package:app/core/utlis/app_images.dart';
import 'package:app/features/spalsh_screen/presentation/views/widgets/row_logo_photos.dart';
import 'package:flutter/material.dart';

class SpalshScreenBody extends StatelessWidget {
  const SpalshScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RowLogoPhotos(relativePath1: AppImages.photoLogo1 , relativePath2: AppImages.photoLogo2,),
          SizedBox(height: 10,),
          RowLogoPhotos(relativePath1: AppImages.photoLogo3 , relativePath2: AppImages.photoLogo4,)
        ],
      ),
    );
  }
}


