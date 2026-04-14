import 'package:flutter/material.dart';
import 'package:marketi/core/responsive/extensions.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.color,
    this.child,
    this.border,
  });
  final double width;
  final double height;
  final double borderRadius;
  final Color? color;
  final Widget? child;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: border,
      ),
      child: child,
    );
  }
}
