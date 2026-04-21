import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_row_home_page.dart';
import 'package:marketi/features/forget_password/presentation/view/screens/congratulations.dart';
import 'package:marketi/features/forget_password/presentation/view_model/create_password/cubit/create_password_cubit.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key, required this.email});
  final String email;

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isSeen = true;
  bool isSeenConfirm = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Gap(50.h),
            CustomRowHomePage(isSeen: true),
            Gap(80.h),
            Image.asset(
              "assets/images/forget_password/create_new_password.png",
              width: 486.w,
            ),
            Gap(30.h),
            CustomText(
              text:
                  "\t\t\t\tNew password must be\ndifferent from last password",
              fontSize: 18.s,
              fontWeight: FontWeight.bold,
              color: AppColors.myNavy,
            ),
            Gap(16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Password",
                  fontSize: 16.5.s,
                  fontWeight: FontWeight.w600,
                  color: AppColors.ContainerColorPrimary,
                ),
                CustomTextFormField(
                  readOnly: false,

                  hintText: 'Password',
                  obscureText: !isSeen,
                  onTap: () {
                    isSeen = !isSeen;
                    setState(() {});
                  },
                  suffixIcon: isSeen
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  prefixIcon: Icons.lock_outline,
                  suffixColor: AppColors.labeTextColor,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }

                    final passwordRegex = RegExp(
                      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
                    );

                    if (!passwordRegex.hasMatch(value)) {
                      return "Password must be at least 8 characters long and include uppercase, lowercase, numbers, and special characters";
                    }
                    return null;
                  },
                ),
              ],
            ),
            Gap(16.h),
            // confirm password
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Confirm Password",
                  fontSize: 16.5.s,
                  fontWeight: FontWeight.w600,
                  color: AppColors.ContainerColorPrimary,
                ),
                CustomTextFormField(
                  readOnly: false,

                  hintText: 'Confirm Password',
                  obscureText: !isSeenConfirm,
                  suffixColor: AppColors.labeTextColor,

                  onTap: () {
                    isSeenConfirm = !isSeenConfirm;
                    setState(() {});
                  },
                  suffixIcon: isSeenConfirm
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  prefixIcon: Icons.lock_outline,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }

                    final passwordRegex = RegExp(
                      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
                    );

                    if (!passwordRegex.hasMatch(value)) {
                      return "Password must be at least 8 characters long and include uppercase, lowercase, numbers, and special characters";
                    }
                    return null;
                  },
                ),
              ],
            ),
            // space
            Gap(16.h),
            // button
            BlocConsumer<CreatePasswordCubit, CreatePasswordState>(
              listener: (context, state) {
                if (state is CreatePasswordSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Congratulations()),
                  );
                }
                if (state is CreatePasswordLoading) {
                  Center(child: CircularProgressIndicator());
                }
              },
              builder: (context, state) {
                return state is CreatePasswordLoading
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton(
                        text: "Save Password",
                        fontSize: 22.s,
                        fontWeight: FontWeight.bold,
                        colorText: AppColors.myWhite,
                        colorBackGroundButton: AppColors.myBlue,
                        onPressed: () {
                          context.read<CreatePasswordCubit>().createNewPassword(
                            widget.email,
                            _passwordController.text,
                            _confirmPasswordController.text,
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
