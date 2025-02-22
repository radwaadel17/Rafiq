import 'package:app/core/utlis/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RafeekApp());
}
class RafeekApp extends StatelessWidget {
  const RafeekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
    routerConfig: Approuter.router,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Alexandria',
     ),
    );
  }
}