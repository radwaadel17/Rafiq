import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DaySlotsSection extends StatefulWidget {
  const DaySlotsSection({
    super.key,
  });

  @override
  State<DaySlotsSection> createState() => _DaySlotsSectionState();
}

class _DaySlotsSectionState extends State<DaySlotsSection> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "اليوم",
              style: Styles.textstyle18,
            ),
            const Gap(16),
            SvgPicture.asset(Assets.icons.arrowDown)
          ],
        ),
        const Gap(10),
        SizedBox(
          height: 32,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? activeColor : disabledColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Text(
                        "3:00 م",
                        style: Styles.textstyle14.copyWith(
                          color: selectedIndex == index ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, int index) => const Gap(12),
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
