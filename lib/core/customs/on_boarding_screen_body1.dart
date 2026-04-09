import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/customs/custom_image_on_boarding.dart';
import 'package:marketi/core/customs/custom_row_container.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/features/start-up/onBoarding/screens/onBoarding_screen2.dart';

class OnBoardingScreenBody1 extends StatelessWidget {
  const OnBoardingScreenBody1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageOnBoarding(
          image: "assets/images/onBoarding/Illustration_Onboarding_1.png",
          width: 410.w,
          height: 366.h,
        ),
        Gap(40.s),
        CustomRowContainer(
          width1: 25,
          height1: 22,
          color1: AppColors.ContainerColorPrimary,
          width2: 20,
          height2: 17,
          color2: AppColors.ContainerColorSecondry,
          width3: 20,
          height3: 17,
          color3: AppColors.ContainerColorSecondry,
        ),
        Gap(40.s),
        CustomText(
          text: 'Welcome to Marketi',
          fontSize: 27.s,
          fontWeight: FontWeight.w500,
          color: AppColors.ContainerColorPrimary,
        ),
        Gap(40.s),
        CustomText(
          text:
              '  Discover a world of endless\n  possibilities and shop from\nthe comfort of your fingertips\nBrowse through a wide range\n  of products, from fashion\n  and electronics to home.',
          fontSize: 18.s,
          fontWeight: FontWeight.w500,
          color: AppColors.ContainerColorPrimary,
        ),
        Gap(40.s),
        CustomButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreen2()),
            );
          },
          text: 'Next',
          fontSize: 18.s,
          fontWeight: FontWeight.w500,
          colorText: AppColors.myWhite,
          colorBackGroundButton: AppColors.myBlue,
        ),
      ],
    );
  }
}
