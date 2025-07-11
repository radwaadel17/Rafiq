import 'package:app/features/doctor_home/presentation/views/widgets/appointment_statistics_section.dart';
import 'package:app/features/doctor_home/presentation/views/widgets/day_slots_section.dart';
import 'package:app/features/doctor_home/presentation/views/widgets/day_visits_section.dart';
import 'package:app/features/doctor_home/presentation/views/widgets/doctor_home_header.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorHomeHeader(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppointmentStatisticsSection(),
                    Gap(24),
                    DaySlotsSection(),
                    Gap(16),
                    DayVisitsSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
