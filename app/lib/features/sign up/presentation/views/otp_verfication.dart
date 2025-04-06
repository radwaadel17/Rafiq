import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/otp_verfication_body.dart';
import 'package:flutter/material.dart';

class OtpVarfication extends StatelessWidget {
  const OtpVarfication({super.key, required this.user});
   final UserSignupEntity user ;
  @override
  Widget build(BuildContext context) {
    return  OtpVerficationBody(user: user,);
  }
}