import 'package:app/core/utlis/service_locator.dart';
import 'package:app/features/forget_password/data/repos/forget_password_repo_imp.dart';
import 'package:app/features/forget_password/presentation/manager/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:app/features/forget_password/presentation/manager/reset%20password%20cubit/reset_password_cubit.dart';
import 'package:app/features/forget_password/presentation/views/widgets/otp_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(
          create: (context) => ForgetPasswordCubit(getIt<ForgetPasswordRepoImp>())),
           BlocProvider(
          create: (context) => ResetPasswordCubit(getIt<ForgetPasswordRepoImp>())),
      ],
      child:  OtpScreenBody(email: email,),
    );
  }
}
