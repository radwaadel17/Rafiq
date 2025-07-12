import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/profile/presentation/views/widgets/header.dart';
import 'package:app/features/profile/presentation/views/widgets/profile_photo.dart';
import 'package:app/features/profile/presentation/views/widgets/text_and_icon.dart';
import 'package:app/features/profile/presentation/views/widgets/title_text.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  String? savedName;
  String? email;
  void getNameAndMail(){
    final Box box = Hive.box('UserName');
    final Box boxmail = Hive.box('userEmail');
    savedName = box.get('AccName');
    email = boxmail.get('EmailName');
  print("Retrieved Name: $savedName");
  print("Retrieved Email: $email");
  }
  @override
  void initState() {
    super.initState();
    getNameAndMail();
  }
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
          savedName == null ? 'person123' : savedName!,
          style: Styles.textstyle18,
        ),
      ),
      Center(
        child: Text(
          email == null ? 'person123@gmail.com' : email! ,
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
