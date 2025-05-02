import 'package:app/features/sign%20up/presentation/views/widgets/column_Doctor_identity.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_custom_app_bar.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DoctorIdentityBody extends StatelessWidget {
  const DoctorIdentityBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SignUpCustomAppBar(imgPath: Assets.images.load2.path),
        ),
        const ColumnDoctorIdentity(),
      ],
    );
  }
}

