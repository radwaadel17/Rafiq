import 'package:app/core/utlis/service_locator.dart';
import 'package:app/features/sign%20up/data/repos/sign_up_repo_imp.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/features/sign%20up/presentation/manager/verfiy%20email%20cubit/verfiy_emial_cubit.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/otp_verfication_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpVarfication extends StatelessWidget {
  const OtpVarfication({super.key, required this.user});
  final UserSignupEntity user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerfiyEmailCubit(getIt<SignUpRepoImp>()),
      child: OtpVerficationBody(
        user: user,
      ),
    );
  }
}
