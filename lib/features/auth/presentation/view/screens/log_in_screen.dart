// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/core/customs/custom_image_on_boarding.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isSeen = false;
  bool isCkecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.myWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(140.h),
              CustomImageOnBoarding(
                image: "assets/logo/logo.png",
                width: 322.w,
                height: 282.h,
              ),
              CustomTextFormField(
                lableText: 'Username or Email',
                prefixIcon: Icons.email_outlined,
              ),
              Gap(16.h),
              CustomTextFormField(
                lableText: 'Password',
                prefixIcon: Icons.lock_outlined,
                suffixIcon: isSeen
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                onTap: () {
                  isSeen = !isSeen;
                  setState(() {});
                },
              ),
              CustomRowTexts(
                isCkecked: isCkecked,
                onChanged: (value) {
                  isCkecked = value!;
                  setState(() {});
                },
              ),
              Gap(35.h),
              CustomButton(
                text: "Log In",
                fontSize: 20.s,
                color: AppColors.myWhite,
                fontWeight: FontWeight.w800,
                onPressed: () {},
              ),
              Gap(35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Are you new in Marketi ",
                    fontSize: 14.s,
                    color: AppColors.myNavy,
                  ),
                  CustomText(
                    text: "register?",
                    fontSize: 14.s,
                    color: AppColors.light_blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRowTexts extends StatelessWidget {
  const CustomRowTexts({super.key, this.onChanged, required this.isCkecked});
  final void Function(bool?)? onChanged;
  final bool isCkecked;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: AppColors.myBlue,
          value: isCkecked,
          onChanged: onChanged,
        ),
        CustomText(
          text: "Remember Me",
          fontSize: 14.s,
          color: AppColors.myNavy,
          fontWeight: FontWeight.w600,
        ),
        Spacer(),
        CustomText(
          text: "Forgot Password?",
          fontSize: 14.s,
          color: AppColors.light_blue,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
