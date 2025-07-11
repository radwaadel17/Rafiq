import 'package:app/features/forget_password/presentation/views/widgets/new_password_screen_body.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key, required this.email});
  final String email ;

  @override
  Widget build(BuildContext context) {
    return NewPasswordBody(email: email,);
  }
}