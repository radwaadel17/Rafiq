import 'package:app/features/doctors/domain/entity/doctor_entity.dart';
import 'package:app/features/home/presentation/views/widgets/doctor_detalis_view_body.dart';
import 'package:flutter/material.dart';

class DoctorDeatailsView extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDeatailsView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoctorDetailsBody(
        doctor: doctor,
      ),
    );
  }
}
