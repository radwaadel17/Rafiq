import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/bloc_observer.dart';
import 'package:app/core/utlis/service_locator.dart';
import 'package:app/features/sign%20in/data/repos/sign_in_repo_imp.dart';
import 'package:app/features/sign%20in/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:app/features/sign%20up/data/repos/sign_up_repo_imp.dart';
import 'package:app/features/sign%20up/presentation/manager/signup%20cubit/sign_up_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setup();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const RafeekApp(), // Wrap your app
    ),
  );
}

class RafeekApp extends StatelessWidget {
  const RafeekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => SignUpCubit(getIt<SignUpRepoImp>())),
          BlocProvider(
              create: (context) => SignInCubit(getIt<SignInRepoImp>())),
          
        ],
        child: MaterialApp.router(
          // ignore: deprecated_member_use
          locale : const Locale('ar'),
          localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          // ignore: deprecated_member_use
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          routerConfig: Approuter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'Alexandria', scaffoldBackgroundColor: Colors.white),
        ),
      ),
    );
  }
}
