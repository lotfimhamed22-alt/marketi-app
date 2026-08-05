import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/themes/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';

class CustomRowNameOffer extends StatelessWidget {
  const CustomRowNameOffer({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          fontSize: 20.sp,
          color: AppColors.myBlack,
          fontWeight: FontWeight.bold,
        ),
        GestureDetector(
          onTap: onTap,
          child: CustomText(
            text: "View all",
            fontSize: 16.sp,
            color: AppColors.myBlue,
          ),
        ),
      ],
    );
  }
}
