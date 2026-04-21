import 'package:flutter/material.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/responsive/extensions.dart';

class SendCodeButton extends StatelessWidget {
  const SendCodeButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Send Code",
      fontSize: 18.s,
      fontWeight: FontWeight.w700,
      colorText: AppColors.myWhite,
      colorBackGroundButton: AppColors.myBlue,
      onPressed: onPressed,
    );
  }
}
