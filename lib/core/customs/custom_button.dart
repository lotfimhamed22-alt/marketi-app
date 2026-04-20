import 'package:flutter/material.dart';
import 'package:marketi/core/responsive/extensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.onPressed,
    required this.colorText,
    this.colorBackGroundButton,
  });
  final String text;
  final double fontSize;
  final Color colorText;
  final FontWeight fontWeight;
  final void Function()? onPressed;
  final Color? colorBackGroundButton;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: colorBackGroundButton,
      minWidth: 347.w,
      height: 48.h,
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
        1,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: colorText,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
