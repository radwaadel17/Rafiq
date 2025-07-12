import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';

class DoctorHomeHeader extends StatefulWidget {
  const DoctorHomeHeader({
    super.key,
  });

  @override
  State<DoctorHomeHeader> createState() => _DoctorHomeHeaderState();
}

class _DoctorHomeHeaderState extends State<DoctorHomeHeader> {
  String? savedName;
  String? email;
  void getNameAndMail(){
    final Box box = Hive.box('doctorName');
    final Box boxmail = Hive.box('doctorEmail');
    savedName = box.get('AccName');
    email = boxmail.get('EmailName');
  }
  @override
  void initState() {
    super.initState();
    getNameAndMail();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                Assets.images.userAvatar.path,
                height: 38,
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   savedName == null ?  "أهلاً،\nدكتورuser" : 'أهلا يا دكتور \n ${savedName}',
                    style: Styles.textstyle14,
                  ),
                ],
              )
            ],
          ),
          SvgPicture.asset(Assets.icons.notificationsOn)
        ],
      ),
    );
  }
}
