import 'package:app/core/utlis/api_service.dart';
import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/service_locator.dart';
import 'package:app/features/forget_password/data/data%20sources/remote_data_source_forget_imp.dart';
import 'package:app/features/forget_password/data/repos/forget_password_repo_imp.dart';
import 'package:app/features/forget_password/presentation/manager/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:app/features/forget_password/presentation/manager/reset%20password%20cubit/reset_password_cubit.dart';
import 'package:app/features/forget_password/presentation/manager/verfiyPasswordResetCode/verfyCubit.dart';
import 'package:app/features/questions/data/repos/result_repo_imp.dart';
import 'package:app/features/questions/presentation/manager/result_cubit.dart';
import 'package:app/features/sign%20in/data/repos/sign_in_repo_imp.dart';
import 'package:app/features/sign%20in/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:app/features/sign%20up/data/repos/sign_up_repo_imp.dart';
import 'package:app/features/sign%20up/presentation/manager/signup%20cubit/sign_up_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userName');
  await Hive.openBox('userEmail');
  await Hive.openBox('doctorName');
  await Hive.openBox('doctorEmail');
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
          BlocProvider(
            create: (context) => ResultCubit(getIt<ResultRepoImp>()),
          ),
          BlocProvider(
            create: (context) => ResultCubit(getIt<ResultRepoImp>()),
          ),
          BlocProvider(
              create: (context) => ForgetPasswordCubit(ForgetPasswordRepoImp(
                  RemoteDataSourceForgetImp(ApiService(Dio()))))),
          BlocProvider(
              create: (context) => VerfiyCubit(ForgetPasswordRepoImp(
                  RemoteDataSourceForgetImp(ApiService(Dio()))))),
          BlocProvider(
              create: (context) => ResetPasswordCubit(ForgetPasswordRepoImp(
                  RemoteDataSourceForgetImp(ApiService(Dio()))))),
        ],
        child: MaterialApp.router(
          locale: const Locale('ar'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          //locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          routerConfig: Approuter.router,
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            fontFamily: 'Alexandria',
            scaffoldBackgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
