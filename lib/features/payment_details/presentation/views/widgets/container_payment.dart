import 'package:flutter/material.dart';

class ContainerPayment extends StatelessWidget {
  const ContainerPayment({
    super.key,
    required this.image, required this.index,
  });
  final String image;
  final bool index ; 
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      duration: const Duration(milliseconds: 300),
      height: 63,
      width: 103,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: index == true ? Colors.green : Colors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Image.asset(
        image,
        height: 18,
      )),
    );
  }
}
