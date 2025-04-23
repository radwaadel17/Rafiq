import 'package:app/core/utlis/service_locator.dart';
import 'package:app/features/update_password/data/repos/forget_password_repo_imp.dart';
import 'package:app/features/update_password/presentation/manager/forget%20password%20cubit/forget_password_cubit.dart';
import 'package:app/features/update_password/presentation/views/widgets/forget_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(getIt<ForgetPasswordRepoImp>()),
      child: const ForgetPasswordBody(),
    );
  }
}
