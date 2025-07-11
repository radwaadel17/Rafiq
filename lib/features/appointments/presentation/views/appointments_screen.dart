import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/appointments/presentation/views/widgets/appointment_item.dart';
import 'package:app/features/appointments/presentation/views/widgets/appointment_type_section.dart';
import 'package:app/features/appointments/presentation/views/widgets/hoizontal_calendar_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum AppointmentType { online, clinic }

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "المواعيد",
          style: Styles.textstyle20,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppointmentTypeSection(),
              const Gap(22),
              const HorizontalCalendarSection(),
              const Gap(16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, int index) {
                  return const AppointmentItem();
                },
                separatorBuilder: (_, int index) => const Gap(8),
                itemCount: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
