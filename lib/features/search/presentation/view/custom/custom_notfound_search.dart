import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/themes/app_colors.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/customs/custom_text.dart';

class CustomNotfoundSearch extends StatelessWidget {
  const CustomNotfoundSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20.h),
        Image.asset("assets/images/search/Search_Not_Found.png", width: 400.w),
        Gap(25.h),
        //
        CustomText(
          text: "Oops Not Found!",
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
        ),
        //
        Gap(30.h),
        CustomText(
          text:
              "Check our big offers, fresh products\n\t\t\t\t\t\t\tand fill your cart with items",
          fontSize: 18.sp,
          fontWeight: FontWeight.w300,
          color: AppColors.myNavy,
        ),
        Gap(30.h),
        CustomButton(
          text: "Continue Shopping",
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          colorText: AppColors.myWhite,
          colorBackGroundButton: AppColors.myBlue,
          onPressed: () {},
        ),
      ],
    );
  }
}
