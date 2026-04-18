import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/customs/custom_image_on_boarding.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_row_home_page.dart';

class Congratulations extends StatelessWidget {
  const Congratulations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      body: CongratulationsBody(),
    );
  }
}

class CongratulationsBody extends StatelessWidget {
  const CongratulationsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Gap(50.h),
          CustomRowHomePage(isSeen: false),
          Gap(80.h),
          CustomImageOnBoarding(
            image: "assets/images/congrates/Congratulations.png",
            width: 543.52.w,
            //height: 256.h,
          ),
          Gap(30.h),
          CustomText(
            text: "Congratulations",
            fontSize: 24.s,
            fontWeight: FontWeight.bold,
          ),
          Gap(20.h),
          CustomText(
            text:
                "You have updated the password. please\n login again with your latest password",
            fontSize: 20.s,
            fontWeight: FontWeight.w400,
            color: AppColors.myNavy,
          ),
          Gap(20.h),
          CustomButton(
            text: "Log in",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            colorText: AppColors.myWhite,
            colorBackGroundButton: AppColors.myBlue,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
