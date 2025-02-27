import 'package:app/features/on_boarding_screen/presentation/views/on_boarding_screen.dart';
import 'package:app/features/sign%20in/presentation/views/sign_in_screen.dart';
import 'package:app/features/sign%20up/presentation/views/sign_up_doctor_screen.dart';
import 'package:app/features/sign%20up/presentation/views/sign_up_parents_screen.dart';
import 'package:app/features/spalsh_screen/presentation/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class Approuter {
  static const onBoardingKey = '/onBoardingScreen';
  static const signUpDoctorScreenKey = '/SignUpdoctor';
  static const signUpParentsScreenKey = '/SignUpParents';
  static const signIn = '/SignIn';



  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: onBoardingKey,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: signUpDoctorScreenKey,
        builder: (context, state) => const SignUpDoctorScreen(),
      ),
       GoRoute(
        path: signUpParentsScreenKey,
        builder: (context, state) => const SignUpParentsScreen(),
      ),
       GoRoute(
        path: signIn,
        builder: (context, state) => const SignInScreen(),
      ),
    ],
  );
}
//GoRouter.of(context).push(Approuter.KSearchView);
