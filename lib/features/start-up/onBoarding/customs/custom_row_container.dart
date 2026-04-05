import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_container.dart';

class CustomRowContainer extends StatelessWidget {
  const CustomRowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainer(
          width: 22,
          height: 22,
          borderRadius: 80,
          color: AppColors.ContainerColorPrimary,
        ),
        Gap(4),
        CustomContainer(
          width: 17,
          height: 17,
          borderRadius: 50,
          color: AppColors.ContainerColorSecondry,
        ),
        Gap(4),

        CustomContainer(
          width: 17,
          height: 17,
          borderRadius: 50,
          color: AppColors.ContainerColorSecondry,
        ),
      ],
    );
  }
}
