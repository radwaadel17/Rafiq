import 'package:app/core/widgets/app_input.dart';
import 'package:flutter/material.dart';

class DoctorSreach extends StatelessWidget {
  const DoctorSreach({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppInput(
      onChanged: (data) {},
      hintText: 'البحث عن طبيب',
      controller: TextEditingController(),
    );
  }
}
