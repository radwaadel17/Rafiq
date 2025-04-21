import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/app_button.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.images.doctorImage.path),
                      ),
                    ),
                  ),
                  const Gap(6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "د.علي إبراهيم",
                        style: Styles.textstyle14,
                      ),
                      const Gap(4),
                      Text(
                        "طبيب أطفال",
                        style: Styles.textstyle14,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: AppButton(
            height: 38,
            onTap: () {},
            text: "تفاصيل",
          ),
        )
      ],
    );
  }
}
