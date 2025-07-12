import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/sign%20in/presentation/views/sign_in_screen.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';

class DoctorProfileHeader extends StatefulWidget {
  const DoctorProfileHeader({
    super.key,
  });

  @override
  State<DoctorProfileHeader> createState() => _DoctorProfileHeaderState();
}

class _DoctorProfileHeaderState extends State<DoctorProfileHeader> {
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
  void showLogoutDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Logout",
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "مغادرة الصفحة",
                  style: Styles.textstyle14.copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "هل انت متأكد انك تريد المغادرة؟",
                  style: Styles.textstyle14.copyWith(
                    color: secondaryColor,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "الغاء",
                        style: Styles.textstyle14.copyWith(
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const SignInScreen(),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'مغادرة',
                        style: Styles.textstyle14.copyWith(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return Transform.scale(
        scale: anim.value,
        child: Opacity(
          opacity: anim.value,
          child: child,
        ),
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: GestureDetector(
            onTap: (){
                 showLogoutDialog(context);

            },
            child: SvgPicture.asset(Assets.images.logout)),
        ),
        const Gap(16),
        Center(
          child: Stack(
            children: [
              Image.asset(
                Assets.images.userAvatar.path,
                height: 170,
              ),
              Positioned(
                bottom: 10,
                right: 15,
                child: SvgPicture.asset(Assets.images.edit),
              ),
            ],
          ),
        ),
        const Gap(10),
        Text(
        savedName==null? "person123" :  savedName!,
          style: Styles.textstyle18,
        ),
        Text(
         email == null ?  "user123@gmail.com" : email!,
          style: Styles.textstyle16.copyWith(
            color: disabledColor,
          ),
        )
      ],
    );
  }
}
