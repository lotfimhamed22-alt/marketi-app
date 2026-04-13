import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_image_on_boarding.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';

class CustomPopularProduct extends StatefulWidget {
  const CustomPopularProduct({super.key});

  @override
  State<CustomPopularProduct> createState() => _CustomPopularProductState();
}

class _CustomPopularProductState extends State<CustomPopularProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        width: 200.w,
        height: 187.h,
        decoration: BoxDecoration(
          color: AppColors.myWhite,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 19,
              blurStyle: BlurStyle.solid,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 190.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: AppColors.backgroundProductColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Stack(
                  children: [
                    CustomImageOnBoarding(
                      image: "assets/images/Smart_Watch.png",
                      width: 190.w,
                      height: 120.h,
                    ),
                    Positioned(
                      right: 6.s,
                      top: 6.s,
                      child: Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.myWhite,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.favorite_border),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(3.h),
              Row(
                children: [
                  CustomText(
                    text: "499 LE",
                    fontSize: 16.s,
                    color: AppColors.ContainerColorPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  Spacer(),
                  Icon(
                    Icons.star_outline,
                    color: AppColors.ContainerColorPrimary,
                    size: 24.s,
                  ),
                  CustomText(
                    text: "4.9",
                    fontSize: 16.s,
                    color: AppColors.ContainerColorPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  Gap(10.w),
                ],
              ),
              CustomText(
                text: "Smart Watch",
                fontSize: 16.s,
                color: AppColors.ContainerColorPrimary,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
