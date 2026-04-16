import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';

class CustomAppBarForgetPasswordScreen extends StatelessWidget {
  const CustomAppBarForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 52.w,
          height: 52.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.myBorderColor, width: 1),
            // color: AppColors.myBorderColor,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.ContainerColorPrimary,
            ),
          ),
        ),
        Gap(15.w),
        CustomText(
          text: "Forgot Password",
          fontSize: 21.s,
          color: AppColors.myNavy,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
