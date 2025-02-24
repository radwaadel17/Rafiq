import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpalshScreenBody extends StatefulWidget {
  const SpalshScreenBody({super.key});

  @override
  State<SpalshScreenBody> createState() => _SpalshScreenBodyState();
}

class _SpalshScreenBodyState extends State<SpalshScreenBody>
    with TickerProviderStateMixin {
  late AnimationController animationController1;
  late AnimationController animationController2;
  late AnimationController animationController3;
  late AnimationController animationController4;

  late Animation<Offset> slidingAnimationOne;
  late Animation<Offset> slidingAnimationTwo;
  late Animation<Offset> slidingAnimationThree;
  late Animation<Offset> slidingAnimationFour;

  late Animation<double> fadeAnimationOne;
  late Animation<double> fadeAnimationTwo;
  late Animation<double> fadeAnimationThree;
  late Animation<double> fadeAnimationFour;

  @override
  void initState() {
    super.initState();
    initSlidinganimation();
    startAnimations();
    navigateTohomeview();
  }

  @override
  void dispose() {
    super.dispose();
    animationController1.dispose();
    animationController2.dispose();
    animationController3.dispose();
    animationController3.dispose();
  }
 void navigateTohomeview() {
    Future.delayed(const Duration(seconds: 9), () {
      // Get.to(const HomeView(), transition: Transition.fade);
      GoRouter.of(context).push(Approuter.onBoardingKey);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                  height: 48,
                  child: Image(image: AssetImage(AppImages.photoLogo1))),
              const SizedBox(
                width: 10,
              ),
              AnimatedBuilder(
                animation: slidingAnimationThree,
                builder: (context, _) {
                  return FadeTransition(
                      opacity: fadeAnimationThree,
                      child: SlideTransition(
                        position: slidingAnimationThree,
                        child: const SizedBox(
                            height: 48,
                            child:
                                Image(image: AssetImage(AppImages.photoLogo2))),
                      ));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: slidingAnimationOne,
                builder: (context, _) {
                  return FadeTransition(
                    opacity: fadeAnimationOne,
                    child: SlideTransition(
                      position: slidingAnimationOne,
                      child: const SizedBox(
                          height: 48,
                          child:
                              Image(image: AssetImage(AppImages.photoLogo3))),
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
              AnimatedBuilder(
                animation: slidingAnimationTwo,
                builder: (context, _) {
                  return FadeTransition(
                    opacity: fadeAnimationTwo,
                    child: SlideTransition(
                      position: slidingAnimationTwo,
                      child: const SizedBox(
                          height: 48,
                          child:
                              Image(image: AssetImage(AppImages.photoLogo4))),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 15,
          ),
          AnimatedBuilder(
            animation: slidingAnimationFour,
            builder: (context, _) {
              return FadeTransition(
                  opacity: fadeAnimationFour,
                  child: SlideTransition(
                      position: slidingAnimationFour,
                      child: SizedBox(
                        width: context.screenWidth * 0.9,
                        child: Column(
                          children: [
                            TextArabicWithStyle(
                              text: 'أهلاً، أنا رَفيق',
                              textsyle: Styles.textstyle24
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          TextArabicWithStyle(
                              text:
                                  'مساعدك الأمثل لدعم الأطفال ذوي التوحد، يقربك من الأطباء، يوفر لك مجتمعًا للآباء، ويقدم حلولًا مبتكرة لتعليم طفلك',
                              textsyle: Styles.textstyle24,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )));
            },
          ),
        ],
      ),
    );
  }

  void initSlidinganimation() {
    animationController1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    animationController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    animationController3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    animationController4 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    slidingAnimationOne =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController1);
    slidingAnimationTwo =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController2);
    slidingAnimationThree =
        Tween<Offset>(begin: const Offset(0, -5), end: Offset.zero)
            .animate(animationController3);
    slidingAnimationFour =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController4);

    fadeAnimationOne = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController1, curve: Curves.easeIn));

    fadeAnimationTwo = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController2, curve: Curves.easeIn));

    fadeAnimationThree = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController3, curve: Curves.easeIn));
    fadeAnimationFour = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController4, curve: Curves.easeIn));
  }

  void startAnimations() async {
    // تشغيل أنيميشن الصورة 1
    await animationController3.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    await animationController1.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    await animationController2.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    await animationController4.forward();
  }
}
