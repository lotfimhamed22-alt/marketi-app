import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/start-up/onBoarding/customs/custom_container.dart';

class CustomRowContainer extends StatelessWidget {
  const CustomRowContainer({
    super.key,
    required this.width1,
    required this.height1,
    required this.color1,
    required this.width2,
    required this.height2,
    required this.color2,
    required this.width3,
    required this.height3,
    required this.color3,
  });
  final double width1;
  final double height1;
  final Color color1;

  final double width2;
  final double height2;
  final Color color2;

  final double width3;
  final double height3;
  final Color color3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainer(
          width: width1.w,
          height: height1.h,
          borderRadius: 80.r,
          color: color1,
        ),
        Gap(4),
        CustomContainer(
          width: width2.w,
          height: height2.h,
          borderRadius: 80.r,
          color: color2,
        ),
        Gap(4),

        CustomContainer(
          width: width3.w,
          height: height3.h,
          borderRadius: 80.r,
          color: color3,
        ),
      ],
    );
  }
}
