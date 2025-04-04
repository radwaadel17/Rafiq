import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_parents_body.dart';
import 'package:flutter/material.dart';

class SignUpParentsScreen extends StatelessWidget {
  const SignUpParentsScreen({super.key, required this.user});
  final UserSignupEntity user;
  @override
  Widget build(BuildContext context) {
    return SignUpParentsBody(
      user: user,
    );
  }
}
