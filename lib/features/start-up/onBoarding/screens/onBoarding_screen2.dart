// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_button.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_image_on_boarding.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_row_container.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_text.dart';
import 'package:marketi/features/start-up/onBoarding/customs/on_boarding_screen_body2.dart';
import 'package:marketi/features/start-up/onBoarding/screens/onBoarding_screen3.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: OnBoardingScreenBody2(),
    );
  }
}
