
import 'package:app/features/profile/presentation/views/widgets/header.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Header(),
      ],
    );
  }
}

