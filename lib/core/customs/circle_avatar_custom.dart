import 'package:flutter/material.dart';
import 'package:marketi/core/responsive/extensions.dart';

class CircleAvatarCustom extends StatelessWidget {
  const CircleAvatarCustom({
    super.key,
    required this.h,
    required this.w,
    required this.imagePath,
  });
  final double h;
  final double w;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
