// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/customs/custom_row_container.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/network/api/dio_consumer.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/auth/presentation/view/screens/log_in_screen.dart';
import 'package:marketi/features/auth/presentation/view_model/signin_cubit/cubit/sign_in_cubit.dart';
import 'package:marketi/features/onboarding/data/static.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 800.h,
            child: PageView.builder(
              controller: controller,
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
                print(currentIndex);
              },
              itemCount: onboardingList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Gap(180.h),
                      Image.asset(
                        onboardingList[index].imageUrl!,
                        width: 600.w,
                        height: 320.h,
                        fit: BoxFit.contain,
                      ),
                      Gap(20.h),
                      CustomRowContainer(
                        width1: currentIndex == 0 ? 25 : 20,
                        height1: currentIndex == 0 ? 22 : 17,
                        color1: currentIndex == 0
                            ? AppColors.ContainerColorPrimary
                            : AppColors.ContainerColorSecondry,
                        width2: currentIndex == 1 ? 25 : 20,
                        height2: currentIndex == 1 ? 22 : 17,
                        color2: currentIndex == 1
                            ? AppColors.ContainerColorPrimary
                            : AppColors.ContainerColorSecondry,
                        width3: currentIndex == 2 ? 25 : 20,
                        height3: currentIndex == 2 ? 22 : 17,
                        color3: currentIndex == 2
                            ? AppColors.ContainerColorPrimary
                            : AppColors.ContainerColorSecondry,
                      ),
                      Gap(20.h),
                      CustomText(
                        text: onboardingList[index].text.toString(),
                        fontSize: 30.s,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(30.h),
                      SizedBox(
                        width: 420.w,
                        child: Text(
                          onboardingList[index].body.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.ContainerColorPrimary,
                            fontSize: 20.s,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Gap(20),
          CustomButton(
            onPressed: () {
              currentIndex++;
              print(currentIndex);
              if (currentIndex > onboardingList.length - 1) {
                print("navigate");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SignInCubit(DioConsumer(dio: Dio())),
                      child: LogInScreen(),
                    ),
                  ),
                );
              } else {
                controller.animateToPage(
                  currentIndex,
                  duration: Duration(milliseconds: 900),
                  curve: Curves.linear,
                );
              }
            },
            text: currentIndex == 2 ? 'Get Started' : 'Next',
            fontSize: 18.s,
            fontWeight: FontWeight.w500,
            colorText: AppColors.myWhite,
            colorBackGroundButton: AppColors.myBlue,
          ),
        ],
      ),
    );
  }
}
