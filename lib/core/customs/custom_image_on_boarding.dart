import 'package:flutter/material.dart';

class CustomImageOnBoarding extends StatelessWidget {
  const CustomImageOnBoarding({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });
  final String image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height, child: Image.asset(image));
  }
}
