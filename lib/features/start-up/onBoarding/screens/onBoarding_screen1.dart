// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_image_on_boarding.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_row_container.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnBoardingScreen1Body(),
    );
  }
}

class OnBoardingScreen1Body extends StatelessWidget {
  const OnBoardingScreen1Body({super.key});

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

        CustomRowContainer(),
        Gap(33.s),
        CustomText(
          text: 'Welcome to Marketi',
          fontSize: 27.s,
          fontWeight: FontWeight.w500,
          color: AppColors.ContainerColorPrimary,
        ),
        Gap(33.s),
        CustomText(
          text:
              '  Discover a world of endless\n  possibilities and shop from\nthe comfort of your fingertips\nBrowse through a wide range\n  of products, from fashion\n  and electronics to home.',
          fontSize: 18.s,
          fontWeight: FontWeight.w500,
          color: AppColors.ContainerColorPrimary,
        ),
        Gap(33.s),
      ],
    );
  }
}
