import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "الأشعارات",
          style: Styles.textstyle18,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SvgPicture.asset(
              Assets.icons.arrowBack,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemBuilder: (_, int index) {
          return Row(
            children: [
              SvgPicture.asset(
                Assets.icons.circularCalendar,
              ),
              const Gap(10),
              Expanded(
                child: Text(
                  "موعد جلستك مع الطبيب غدًا، جهّز استفساراتك مسبقًا.",
                  style: Styles.textstyle16,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (_, int index) {
          return const Gap(18);
        },
        itemCount: 4,
      ),
    );
  }
}
