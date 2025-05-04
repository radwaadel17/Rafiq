import 'package:app/features/sign%20up/presentation/views/widgets/doctor_appoinment_view_body.dart';
import 'package:flutter/material.dart';

class DoctorAppointmentsView extends StatelessWidget {
  const DoctorAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DoctorAppointmentViewBody(),
    );
  }
}