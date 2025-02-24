import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_custom_app_bar.dart';
import 'package:flutter/material.dart';

class SignUpDoctorBody extends StatelessWidget {
  const SignUpDoctorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SignUpCustomAppBar(),
          )
        ],
      ),
    );
  }
}


