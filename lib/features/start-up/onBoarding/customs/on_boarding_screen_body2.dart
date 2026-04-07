import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_button.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_image_on_boarding.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_row_container.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_text.dart';
import 'package:marketi/features/start-up/onBoarding/screens/onBoarding_screen3.dart';

class OnBoardingScreenBody2 extends StatelessWidget {
  const OnBoardingScreenBody2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageOnBoarding(
          image: "assets/images/onBoarding/Illustration_Onboarding_2.png",
          width: 410.w,
          height: 366.h,
        ),
        Gap(40.s),
        CustomRowContainer(
          width1: 20,
          height1: 17.h,
          color1: AppColors.ContainerColorSecondry,
          width2: 25,
          height2: 22,
          color2: AppColors.ContainerColorPrimary,
          width3: 20,
          height3: 17,
          color3: AppColors.ContainerColorSecondry,
        ),
        Gap(40.s),
        CustomText(
          text: 'Easy to Buy',
          fontSize: 27.s,
          fontWeight: FontWeight.w500,
          color: AppColors.ContainerColorPrimary,
        ),
        Gap(40.s),
        CustomText(
          text:
              "Find the perfect item that suits your style\nand needs With secure payment options and fast\n delivery, shopping has never been easier.",
          fontSize: 18.s,
          fontWeight: FontWeight.w500,
          color: AppColors.ContainerColorPrimary,
        ),
        Gap(113.s),
        CustomButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreen3()),
            );
          },
          text: 'Next',
          fontSize: 18.s,
          color: AppColors.myWhite,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
