import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? savedName;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    final Box box = Hive.box('userName');
    savedName = box.get('AccName');
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
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(Approuter.profile);
                },
                child: Image.asset(
                  Assets.images.userAvatar.path,
                  height: 38,
                ),
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    savedName == null || savedName!.isEmpty
                        ? 'أهلاً، أنا\nرَفيقك يا person 123'
                        : 'أهلاً، أنا\nرَفيقك يا $savedName',
                    style: Styles.textstyle14,
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(Assets.icons.notificationsOn),
              const Gap(18),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(Approuter.messages);
                  },
                  child: SvgPicture.asset(Assets.icons.chat)),
              const Gap(18),
              SvgPicture.asset(Assets.icons.menu),
            ],
          )
        ],
      ),
    );
  }
}
