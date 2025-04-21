import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class GiraffeImage extends StatelessWidget {
  final int flex;
  final double? padding;
  const GiraffeImage({
    super.key,
    required this.flex,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.only(top: padding ?? 0),
        child: Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Image.asset(
            Assets.images.giraffe.path,
          ),
        ),
      ),
    );
  }
}
