import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/forget_password/presentation/view/customs/custom_app_bar_forget_password_screen.dart';

class VerificationCodeByEmail extends StatelessWidget {
  const VerificationCodeByEmail({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Gap(50.h),
            CustomAppBarForgetPasswordScreen(),
            Gap(80.h),
            Image.asset(
              "assets/images/forget_password/Verification_Code_With_Email.png",
              width: 430.w,
            ),
            Gap(30.h),
            CustomText(
              text: "Please enter the 4 digit code\n\t\t\tsent to: $email",
              fontSize: 18.s,
              fontWeight: FontWeight.w500,
              color: AppColors.myNavy,
            ),
            // otp text field
          ],
        ),
      ),
    );
  }
}
