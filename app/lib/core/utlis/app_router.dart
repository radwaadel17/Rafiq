import 'package:app/features/forget_password/presentation/views/forget_password_screen.dart';
import 'package:app/features/forget_password/presentation/views/new_password_screen.dart';
import 'package:app/features/forget_password/presentation/views/otp_screen.dart';
import 'package:app/features/on_boarding_screen/presentation/views/on_boarding_screen.dart';
import 'package:app/features/sign%20in/presentation/views/sign_in_screen.dart';
import 'package:app/features/sign%20up/presentation/views/sign_up_doctor_screen.dart';
import 'package:app/features/sign%20up/presentation/views/sign_up_parents_screen.dart';
import 'package:app/features/spalsh_screen/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class Approuter {
  static const onBoardingKey = '/onBoardingScreen';
  static const signUpDoctorScreenKey = '/SignUpdoctor';
  static const signUpParentsScreenKey = '/SignUpParents';
  static const signIn = '/SignIn';
  static const forgetPassword = '/forgetPassword';
  static const otp = '/otp';
  static const newPassword = '/newPass';



  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: signUpDoctorScreenKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignUpDoctorScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: signUpParentsScreenKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignUpParentsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: signIn,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignInScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: onBoardingKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnBoardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: forgetPassword,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ForgetPassword(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: otp,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OtpScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
       GoRoute(
        path: newPassword,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const NewPasswordScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
    ],
  );
}
//GoRouter.of(context).push(Approuter.KSearchView);
