import 'package:flutter/material.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';

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
          fontSize: 20.s,
          color: AppColors.myBlack,
          fontWeight: FontWeight.bold,
        ),
        GestureDetector(
          onTap: onTap,
          child: CustomText(
            text: "View all",
            fontSize: 16.s,
            color: AppColors.myBlue,
          ),
        ),
      ],
    );
  }
}
