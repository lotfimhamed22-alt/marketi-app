import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/forget_password/presentation/view/screens/reset_password_email.dart';
import 'package:marketi/features/forget_password/presentation/view_model/reset_password/cubit/reset_password_cubit.dart';

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
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (context) => ResetPasswordCubit(),
                  child: ForgetPasswordByEmailScreen(),
                ),
              ),
            );
          },
          child: CustomText(
            text: "Forgot Password?",
            fontSize: 14.s,
            color: AppColors.light_blue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
