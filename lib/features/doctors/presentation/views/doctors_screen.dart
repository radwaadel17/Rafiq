import 'package:app/features/doctors/presentation/views/widgets/doctor_search.dart';
import 'package:app/features/doctors/presentation/views/widgets/doctors_list.dart';
import 'package:app/features/doctors/presentation/views/widgets/recommended_doctor_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                DoctorSreach(),
                Gap(8),
                RecommendedDoctorSection(),
                Gap(8),
                DoctorsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
