import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/Label_and_text_field_widget.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_container_box.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_custom_app_bar.dart';
import 'package:flutter/material.dart';

class SignUpDoctorBody extends StatelessWidget {
  const SignUpDoctorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SignUpCustomAppBar(),
          ),
          const SliverToBoxAdapter(
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
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.screenHeight *0.020,
            )
          ),
          const SliverToBoxAdapter(
            child: LabelAndTextField(),
          )
        ],
      ),
    );
  }
}

