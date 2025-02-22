import 'package:flutter/material.dart';

class RowLogoPhotos extends StatelessWidget {
  final String relativePath1;
  final String relativePath2;
  const RowLogoPhotos({
    super.key,
    required this.relativePath1,
    required this.relativePath2
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 48,
            child: Image(image: AssetImage(relativePath1))),
            const SizedBox(width: 10,),
            SizedBox(
            height: 48,
            child: Image(image: AssetImage(relativePath2))),
        ],
      ),
    );
  }
}