import 'package:app/core/utlis/device_size.dart';
import 'package:app/features/Doctor%20Book/presentation/views/widgets/Time_container.dart';
import 'package:app/features/Doctor%20Book/presentation/views/widgets/day_and_month_container.dart';
import 'package:flutter/material.dart';

class RowOfBookDateContainers extends StatelessWidget {
  const RowOfBookDateContainers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.98,
      height: context.screenHeight * 0.11,
      child: const Row(
        children: [
          DayAndMonthContainer(),
          DayAndMonthContainer(),
          Time(),
        ],
      ),
    );
  }
}