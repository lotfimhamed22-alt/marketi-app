import 'package:flutter/material.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/responsive/extensions.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.lableText,
    required this.prefixIcon,
    this.suffixIcon,
    this.onTap,
  });
  final String lableText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: TextStyle(
          color: AppColors.labeTextColor,
          fontSize: 16.s,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(suffixIcon, color: AppColors.labeTextColor),
        ),
        prefixIcon: Icon(prefixIcon, color: AppColors.ContainerColorPrimary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.myBorderColor, width: 2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.myBorderColor, width: 2.w),
        ),
      ),
    );
  }
}
