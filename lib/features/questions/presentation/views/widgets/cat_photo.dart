import 'package:app/core/utlis/device_size.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CatPhoto extends StatelessWidget {
  const CatPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: SizedBox(
          height: context.screenHeight * 0.3,
          child: Image.asset(Assets.images.cat.path)),
    );
  }
}

