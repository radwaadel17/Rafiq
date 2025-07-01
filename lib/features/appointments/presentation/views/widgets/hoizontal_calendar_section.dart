import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class HorizontalCalendarSection extends StatefulWidget {
  const HorizontalCalendarSection({super.key});

  @override
  State<HorizontalCalendarSection> createState() => _HorizontalCalendarSectionState();
}

class _HorizontalCalendarSectionState extends State<HorizontalCalendarSection> {
  DateTime selectedDate = DateTime.now();
  final DateTime startDate = DateTime.now();
  final int daysCount = 7;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.yMMMM('ar').format(selectedDate),
                style: Styles.textstyle16,
              ),
              SvgPicture.asset(
                Assets.icons.filter,
              ),
            ],
          ),
        ),
        const Gap(10),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: daysCount,
            itemBuilder: (context, index) {
              final date = startDate.add(Duration(days: index));
              final isSelected = isSameDate(date, selectedDate);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = date;
                  });
                },
                child: Container(
                  width: 55,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xff7DD996).withOpacity(0.74) : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('d', 'en').format(date),
                          style: Styles.textstyle14.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            DateFormat.EEEE('ar').format(date),
                            style: Styles.textstyle14.copyWith(
                              color: const Color(0xff626262).withOpacity(0.88),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
