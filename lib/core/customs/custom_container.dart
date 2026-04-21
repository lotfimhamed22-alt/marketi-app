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
    this.alignment,
  });
  final double width;
  final double height;
  final double borderRadius;
  final Color? color;
  final Widget? child;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      width: width.w,
      height: height.h,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: border,
      ),
      child: child,
    );
  }
}
