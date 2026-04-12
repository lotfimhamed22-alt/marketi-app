import 'package:flutter/material.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/responsive/extensions.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.lableText,
    required this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    required this.controller,
    this.obscureText,
    this.validator,
    this.hintText,
  });
  final String? lableText;
  final String? hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final void Function()? onTap;
  final TextEditingController controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
      decoration: InputDecoration(
        labelText: lableText,
        hintText: hintText,
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.myRed, width: 2.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.myRed, width: 2.w),
        ),
      ),
    );
  }
}
