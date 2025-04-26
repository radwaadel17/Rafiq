import 'package:app/features/home/presentation/views/widgets/doctor_detalis_view_body.dart';
import 'package:flutter/material.dart';

class DoctorDeatailsView extends StatelessWidget {
  const DoctorDeatailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DoctorDetailsBody(),
    );
  }
}