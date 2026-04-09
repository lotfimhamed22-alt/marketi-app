import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/api/dio_consumer.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/customs/custom_image_on_boarding.dart';
import 'package:marketi/core/customs/custom_row_container.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/features/auth/presentation/view/screens/log_in_screen.dart';
import 'package:marketi/features/auth/presentation/view_model/signin_cubit/cubit/sign_in_cubit.dart';

class OnBoardingScreenBody3 extends StatelessWidget {
  const OnBoardingScreenBody3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageOnBoarding(
          image: "assets/images/onBoarding/Illustration_Onboarding_3.png",
          width: 410.w,
          height: 366.h,
        ),
        Gap(40.s),
        CustomRowContainer(
          width1: 20,
          height1: 17.h,
          color1: AppColors.ContainerColorSecondry,
          width2: 20,
          height2: 17,
          color2: AppColors.ContainerColorSecondry,
          width3: 25,
          height3: 22,
          color3: AppColors.ContainerColorPrimary,
        ),
        Gap(40.s),
        CustomText(
          text: 'Wonderful User Experience',
          fontSize: 27.s,
          fontWeight: FontWeight.w500,
          color: AppColors.ContainerColorPrimary,
        ),
        Gap(40.s),
        CustomText(
          text:
              "  Start exploring now and experience the\nconvenience of online shopping at its best.",
          fontSize: 18.s,
          fontWeight: FontWeight.w500,
          color: AppColors.ContainerColorPrimary,
        ),
        Gap(138.s),
        CustomButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => SignInCubit(DioConsumer(dio: Dio())),
                  child: LogInScreen(),
                ),
              ),
            );
          },
          text: 'Get Start',
          fontSize: 18.s,
          colorText: AppColors.myWhite,
          colorBackGroundButton: AppColors.myBlue,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
