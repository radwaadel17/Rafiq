import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/custom_app_bar.dart';
import 'package:app/features/on_boarding_screen/presentation/views/widgets/photo_and_text.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/features/sign%20up/presentation/views/sign_up_doctor_screen.dart';
import 'package:app/features/sign%20up/presentation/views/sign_up_parents_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: YouAreBody(),
  ));
}

class YouAreBody extends StatefulWidget {
  const YouAreBody({super.key});

  @override
  State<YouAreBody> createState() => _YouAreBodyState();
}

class _YouAreBodyState extends State<YouAreBody> {
  UserSignupEntity user = UserSignupEntity(
      name: '',
      email: '',
      passowrd: '',
      passwordConfirmation: '',
      phoneNumber: 0,
      role: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: const CustomAppBar(txt: 'أنت تكون',),
          ),
          const Spacer(
            flex: 1,
          ),
          PhotoAndText(
            text: 'طبيب',
            textStyle: Styles.textstyle24.copyWith(fontWeight: FontWeight.w300),
            image: AppImages.youAreDoctor,
            onTap: () {
              user.role = 'doctor';
              debugPrint('${user.role}');
               Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SignUpDoctorScreen(
                      user: user,
                    );
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
              
            },
          ),
          const Spacer(
            flex: 2,
          ),
          PhotoAndText(
            text: 'الأب أو الأم',
            textStyle: Styles.textstyle24.copyWith(fontWeight: FontWeight.w300),
            image: AppImages.youAreFamily,
            onTap: () {
              user.role = 'parent';
              debugPrint('${user.role}');
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SignUpParentsScreen(
                      user: user,
                    );
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
