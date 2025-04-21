import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TasksSection extends StatelessWidget {
  const TasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorApp.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "المهام",
              style: Styles.textstyle18.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(24),
            Row(
              children: [
                Image.asset(
                  Assets.images.alarm.path,
                  height: 50,
                ),
                const Gap(4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ادائك اليومي",
                              style: Styles.textstyle18,
                            ),
                            Text(
                              "30%",
                              style: Styles.textstyle16.copyWith(
                                color: accentColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Gap(10),
                      IgnorePointer(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 7,
                            activeTrackColor: accentColor,
                            inactiveTrackColor: Colors.grey.shade300,
                            thumbColor: accentColor,
                            overlayColor: accentColor.withOpacity(0.2),
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
                          ),
                          child: Slider(
                            min: 0,
                            max: 1,
                            value: 0.3,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
