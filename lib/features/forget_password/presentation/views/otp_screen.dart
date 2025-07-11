import 'package:app/features/forget_password/presentation/views/widgets/otp_screen_body.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.email});
  final String email ;

  @override
  Widget build(BuildContext context) {
    return OtpScreenBody(email: email,);
  }
}