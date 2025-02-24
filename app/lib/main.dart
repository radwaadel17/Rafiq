import 'package:app/core/utlis/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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
      child: MaterialApp.router(
        // ignore: deprecated_member_use
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: Approuter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Alexandria',
        ),
      ),
    );
  }
}
