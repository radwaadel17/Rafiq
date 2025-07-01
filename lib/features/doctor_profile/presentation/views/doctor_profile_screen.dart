import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/doctor_profile/presentation/views/widgets/doctor_profile_header.dart';
import 'package:app/features/doctor_profile/presentation/views/widgets/doctor_profile_item.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DoctorProfileHeader(),
                const Gap(16),
                Text(
                  "معلوماتك",
                  style: Styles.textstyle16.copyWith(
                    color: successColor,
                  ),
                ),
                const Gap(16),
                DoctorProfileItem(
                  icon: Assets.icons.profile,
                  title: "بروفايلك",
                  onTap: () {},
                ),
                DoctorProfileItem(
                  icon: Assets.icons.doctors,
                  title: "المعلومات الطبية",
                  onTap: () {},
                ),
                DoctorProfileItem(
                  icon: Assets.icons.appointments,
                  title: "جدولة المواعيد",
                  onTap: () {},
                ),
                DoctorProfileItem(
                  icon: Assets.icons.paymentMethods,
                  title: "طرق الدفع",
                  onTap: () {},
                ),
                Text(
                  "الإعدادات",
                  style: Styles.textstyle16.copyWith(
                    color: successColor,
                  ),
                ),
                const Gap(16),
                DoctorProfileItem(
                  icon: Assets.icons.notifications,
                  title: "الإشعارات",
                  onTap: () {
                    context.goNamed('notifications');
                  },
                ),
                DoctorProfileItem(
                  icon: Assets.icons.settings,
                  title: "إعدادات الحساب",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
