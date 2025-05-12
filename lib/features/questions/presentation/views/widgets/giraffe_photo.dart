import 'package:app/core/utlis/device_size.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class GiraffePhoto extends StatelessWidget {
  const GiraffePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: SizedBox(
        height: context.screenHeight * 0.26,
        child: Image.asset(Assets.images.giraffe.path),
      ),
    );
  }
}
