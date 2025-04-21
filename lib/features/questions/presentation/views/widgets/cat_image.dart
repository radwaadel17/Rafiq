import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CatImage extends StatelessWidget {
  final int flex;
  const CatImage({
    super.key,
    required this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Image.asset(
          Assets.images.cat.path,
        ),
      ),
    );
  }
}
