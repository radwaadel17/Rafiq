import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/doctor_appoinment_view_body.dart';
import 'package:flutter/material.dart';

class DoctorAppointmentsView extends StatelessWidget {
  const DoctorAppointmentsView({super.key , required this.user});
  final UserSignupDoctorEntity user ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoctorAppointmentViewBody(user: user,),
    );
  }
}