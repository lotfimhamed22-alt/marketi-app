// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_row_home_page.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CartBody());
  }
}

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Gap(50.h),
          CustomRowHomePage(text: "Cart", isSeen: true),
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: "Products on Cart",
                fontSize: 22.s,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Gap(20.h),
          CustomCartProduct(),
        ],
      ),
    );
  }
}

class CustomCartProduct extends StatefulWidget {
  const CustomCartProduct({super.key});

  @override
  State<CustomCartProduct> createState() => _CustomCartProductState();
}

class _CustomCartProductState extends State<CustomCartProduct> {
  Set<int> likedIndexes = {};

  Set<int> evaluatedIndexes = {};

  Set<int> isAddedIndex = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.myWhite,
        border: Border.all(color: AppColors.myBlue, width: 0.4.w),
        boxShadow: [BoxShadow(color: Colors.blue.shade100, blurRadius: 10)],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/Smart_Watch.png", width: 150.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Pampers Swaddlers",
                    fontSize: 20.s,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(90.w),
                  Icon(Icons.favorite_outline, size: 25.w),
                ],
              ),
              // 2
              CustomText(
                text: "84 Diapers",
                fontSize: 18.s,
                fontWeight: FontWeight.w400,
                color: AppColors.myNavy,
              ),
              // 3
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Price: 345,00 EGP",
                    fontSize: 20.s,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(90.w),
                  Icon(Icons.star, size: 25.w),
                  Gap(5.w),
                  CustomText(
                    text: "4.9",
                    fontSize: 20.s,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Gap(10.w),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundProductColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Icon(
                      Icons.delete,
                      color: AppColors.myRed,
                      size: 40.s,
                    ),
                  ),
                  Gap(40.w),
                  Container(
                    width: 120.w,
                    height: 60.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.myWhite,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: CustomText(
                      text: "1",
                      fontSize: 22.s,
                      color: AppColors.myBlue,
                    ),
                  ),
                  Gap(40.w),
                  Container(
                    width: 60.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundProductColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Icon(Icons.add, color: AppColors.myBlue, size: 40.s),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
