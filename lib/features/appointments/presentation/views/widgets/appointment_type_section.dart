import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/appointments/presentation/views/appointments_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppointmentTypeSection extends StatefulWidget {
  const AppointmentTypeSection({super.key});

  @override
  State<AppointmentTypeSection> createState() => _AppointmentTypeSectionState();
}

class _AppointmentTypeSectionState extends State<AppointmentTypeSection> {
  AppointmentType selectedType = AppointmentType.online;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "نوع الموعد",
          style: Styles.textstyle18,
        ),
        const Gap(8),
        Row(
          children: [
            _buildAppointmentOption(
              type: AppointmentType.online,
              label: "اونلاين",
            ),
            const Gap(10),
            _buildAppointmentOption(
              type: AppointmentType.clinic,
              label: "في العيادة",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAppointmentOption({
    required AppointmentType type,
    required String label,
  }) {
    final bool isSelected = selectedType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedType = type;
          });
        },
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : const Color(0xffE4E6F0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: Styles.textstyle18.copyWith(
                color: isSelected ? Colors.white : const Color(0xffBFBEBE),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
