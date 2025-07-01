import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                "9:00 ص ",
                style: Styles.textstyle14.copyWith(
                  color: const Color(0xff868686),
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: const Color(0xA1A1A13D).withOpacity(0.24),
              ),
            ),
          ],
        ),
        const Gap(16),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: const Color(0xffF8F9FB),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: Row(
              children: [
                Image.asset(
                  Assets.images.userAvatar.path,
                  height: 38,
                ),
                const Gap(8),
                Column(
                  children: [
                    Text(
                      "محمد عمر",
                      style: Styles.textstyle14,
                    ),
                    const Gap(4),
                    Text(
                      "من 9:00 - 9:30 مساءً",
                      style: Styles.textstyle14,
                    ),
                    const Gap(4),
                    Container(
                      decoration: BoxDecoration(
                        color: activeColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        child: Text(
                          "اكتملت",
                          style: Styles.textstyle12.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
