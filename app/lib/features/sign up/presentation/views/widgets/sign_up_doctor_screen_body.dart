import 'package:app/core/utlis/app_images.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_container_box.dart';
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
          ),
          SliverToBoxAdapter(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              SignUpContainerBox(
                image: AppImages.googleLogo,
              ),
              Spacer(
                flex: 1,
              ),
              SignUpContainerBox(
                image: AppImages.facebookLogo,
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ))
        ],
      ),
    );
  }
}


