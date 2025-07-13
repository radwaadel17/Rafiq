import 'package:app/core/widgets/custom_app_bar.dart';
import 'package:app/features/doctors/domain/entity/doctor_entity.dart';
import 'package:app/features/home/presentation/views/widgets/doctor_info_column.dart';
import 'package:app/features/home/presentation/views/widgets/doctor_photo_container.dart';
import 'package:app/features/home/presentation/views/widgets/row_of_contact_icons.dart';
import 'package:flutter/material.dart';

class DoctorDetailsBody extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorDetailsBody({super.key, required this.doctor});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CustomAppBar(txt: 'تفاصيل الدكتور'),
        ),
        const SliverToBoxAdapter(
          child: DoctorPhotoContainer(),
        ),
        const SliverToBoxAdapter(child: RowOfContactIcons()),
        SliverToBoxAdapter(
          child: DoctorInfo(
            doctor: doctor,
          ),
        )
      ],
    );
  }
}
