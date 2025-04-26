import 'package:app/core/widgets/custom_app_bar.dart';
import 'package:app/features/home/presentation/views/widgets/doctor_photo_container.dart';
import 'package:app/features/home/presentation/views/widgets/row_of_contact_icons.dart';
import 'package:flutter/material.dart';
class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
     slivers: [
       SliverToBoxAdapter(
        child: CustomAppBar(txt: 'تفاصيل الدكتور'),
       ),
      SliverToBoxAdapter(
        child:  DoctorPhotoContainer(),
      ),

      SliverToBoxAdapter(
        child: RowOfContactIcons()
      )
     ],
    );
  }
}






