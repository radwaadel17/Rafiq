import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/profile/presentation/views/widgets/header.dart';
import 'package:app/features/profile/presentation/views/widgets/profile_photo.dart';
import 'package:app/features/profile/presentation/views/widgets/text_and_icon.dart';
import 'package:app/features/profile/presentation/views/widgets/title_text.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Header(),
      const ProfilePhoto(),
      SizedBox(
        height: context.screenHeight * 0.01,
      ),
      Center(
        child: Text(
          'أنس أحمد',
          style: Styles.textstyle18,
        ),
      ),
      Center(
        child: Text(
          'Anas_Ahmed@gmail.com',
          style: Styles.textstyle16.copyWith(color: greyColor),
        ),
      ),
      SizedBox(
        height: context.screenHeight * 0.01,
      ),
      const TitleText(
        txt: "معلوماتك",
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextAndIcon(
              txt: 'بروفايلك',
              imagePath: Assets.icons.profileIcon,
            ),
            TextAndIcon(
              txt: 'معلومات طفلك',
              imagePath: Assets.icons.vector1,
            ),
            TextAndIcon(
              txt: 'جدولة المواعيد',
              imagePath: Assets.icons.vector2,
            ),
            TextAndIcon(
              txt: 'طرق الدفع',
              imagePath: Assets.icons.vector3,
            ),
            const TitleText(txt: 'الاعدادات'),
            TextAndIcon(
              txt: 'الاشعارات',
              imagePath: Assets.icons.group,
            ),
            TextAndIcon(
              txt: 'اعدادات الحساب',
              imagePath: Assets.icons.vector4,
            ),
          ],
        ),
      ),
      SizedBox(
        height: context.screenHeight * 0.01,
      ),
    ]);
  }
}
