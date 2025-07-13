import 'package:app/features/Doctor%20Book/presentation/views/book_view.dart';
import 'package:app/features/appointments/presentation/views/appointments_screen.dart';
import 'package:app/features/conversations/presentation/views/conversations_screen.dart';
import 'package:app/features/doctor_home/presentation/views/doctor_home_screen.dart';
import 'package:app/features/doctor_profile/presentation/views/doctor_profile_screen.dart';
import 'package:app/features/doctors/domain/entity/doctor_entity.dart';
import 'package:app/features/doctors/presentation/views/doctors_screen.dart';
import 'package:app/features/forget_password/presentation/views/forget_password_screen.dart';
import 'package:app/features/home/presentation/views/doctor_details.dart';
import 'package:app/features/home/presentation/views/home_screen.dart';
import 'package:app/features/main_bottom_navigation/doctor_bottom_navigation.dart';
import 'package:app/features/main_bottom_navigation/main_bottom_navigation.dart';
import 'package:app/features/messages/presentation/views/messages_screen.dart';
import 'package:app/features/messages/presentation/views/messages_view.dart';
import 'package:app/features/notifications/presentation/views/notifications_screen.dart';
import 'package:app/features/on_boarding_screen/presentation/views/on_boarding_screen.dart';
import 'package:app/features/on_boarding_screen/presentation/views/widgets/on_boarding_three.dart';
import 'package:app/features/on_boarding_screen/presentation/views/widgets/on_boarding_two.dart';
import 'package:app/features/on_boarding_screen/presentation/views/widgets/you_are_body.dart';
import 'package:app/features/payment_details/presentation/views/payment_details_view.dart';
import 'package:app/features/profile/presentation/views/profile_view.dart';
import 'package:app/features/questions/presentation/views/screens/lets_start_screen.dart';
import 'package:app/features/questions/presentation/views/screens/question_one_screen.dart';
import 'package:app/features/questions/presentation/views/screens/question_three_screen.dart';
import 'package:app/features/sign%20in/presentation/views/sign_in_screen.dart';
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
  static const onBoardingOne = '/one';
  static const onBoardingTwo = '/two';
  static const onBoardingThree = '/three';
  static const youAre = '/DoctorOrparents';
  static const mainBottomNavigation = '/MainBottomNavigation';
  static const doctorDetails = '/doctorDetails';
  static const doctorBook = '/doctorBook';
  static const profile = '/profile';
  static const messages = '/messages';
  static const doctorIdentity = '/docIdentity';
  static const doctorManageAppointment = '/docAppointments';
  static const chatMessage = '/chatMessage';
  static const paymentPage = '/PaymentDetailsBody';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: paymentPage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const PaymentDetailsView(),
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
        path: chatMessage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MessagesScreen(),
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
        path: onBoardingTwo,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnBoardingTwo(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: onBoardingThree,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnBoardingThree(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: youAre,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const YouAreBody(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainBottomNavigation(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/doctors',
            name: 'doctors',
            builder: (context, state) => const DoctorsScreen(),
            routes: [
              // GoRoute(
              //   path: 'search',
              //   name: 'home_search',
              //   builder: (context, state) => const SearchScreen(),
              // ),
            ],
          ),
          GoRoute(
            path: '/questions',
            name: 'questions',
            builder: (context, state) => const LetsStartScreen(),
            routes: [
              GoRoute(
                path: 'question_one',
                name: 'question_one',
                builder: (context, state) => const QuestionOneScreen(),
              ),
              GoRoute(
                path: 'question_three',
                name: 'question_three',
                builder: (context, state) => const QuestionThreeScreen(),
              ),
            ],
          ),
          GoRoute(
            path: doctorDetails,
            name: 'doctorDetails',
            pageBuilder: (context, state) {
              final doctor = state.extra as DoctorModel; // ✅ get passed doctor
              return CustomTransitionPage(
                key: state.pageKey,
                child: DoctorDeatailsView(doctor: doctor), // ✅ pass it to the screen
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              );
            },
          ),
          GoRoute(
            path: doctorBook,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const BookView(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          ),

          // GoRoute(
          //   path: '/calendar',
          //   name: 'calendar',
          //   builder: (context, state) => const CalendarScreen(),
          // ),
        ],
      ),
      GoRoute(
        path: profile,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ProfileView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: messages,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MessagesView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return DoctorBottomNavigation(child: child);
        },
        routes: [
          GoRoute(
            path: '/doctorHome',
            name: 'doctorHome',
            builder: (context, state) => const DoctorHomeScreen(),
          ),
          GoRoute(
            path: '/appointments',
            name: 'appointments',
            builder: (context, state) => const AppointmentsScreen(),
          ),
          GoRoute(
            path: '/doctorProfile',
            name: 'doctorProfile',
            builder: (context, state) => const DoctorProfileScreen(),
            routes: [
              GoRoute(
                path: 'notifications',
                name: 'notifications',
                builder: (context, state) => const NotificationsScreen(),
              ),
            ],
          ),
          GoRoute(
            path: '/conversations',
            name: 'conversations',
            builder: (context, state) => const ConversationsScreen(),
          ),
        ],
      ),
    ],
  );
}
//GoRouter.of(context).push(Approuter.KSearchView);
