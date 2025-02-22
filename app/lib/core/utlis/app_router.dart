import 'package:app/features/spalsh_screen/presentation/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class Approuter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
// GoRouter.of(context).push(Approuter.KSearchView);
