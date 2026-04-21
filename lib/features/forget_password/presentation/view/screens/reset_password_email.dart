import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/forget_password/presentation/view/customs/custom_app_bar_forget_password_screen.dart';
import 'package:marketi/features/forget_password/presentation/view/customs/custom_textfield_email.dart';
import 'package:marketi/features/forget_password/presentation/view/customs/send_code_button.dart';
import 'package:marketi/features/forget_password/presentation/view/screens/verification_code_by_email.dart';
import 'package:marketi/features/forget_password/presentation/view_model/reset_code/cubit/password_code_cubit.dart';
import 'package:marketi/features/forget_password/presentation/view_model/reset_password/cubit/reset_password_cubit.dart';

class ForgetPasswordByEmailScreen extends StatefulWidget {
  const ForgetPasswordByEmailScreen({super.key});

  @override
  State<ForgetPasswordByEmailScreen> createState() =>
      _ForgetPasswordByEmailScreenState();
}

class _ForgetPasswordByEmailScreenState
    extends State<ForgetPasswordByEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(50.h),
                CustomAppBarForgetPasswordScreen(),
                Gap(80.h),
                Image.asset(
                  "assets/images/forget_password/Forgot_Password_With_Email.png",
                  width: 286.w,
                ),
                Gap(30.h),
                CustomText(
                  text:
                      "Please enter your email address to\n\t\t\t\t\t\t\treceive a verification code",
                  fontSize: 18.s,
                  fontWeight: FontWeight.w500,
                  color: AppColors.myNavy,
                ),

                // Gap(16.h),
                CustomTextFieldEmail(emailController: _emailController),
                Gap(16.h),
                BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                  listener: (context, state) {
                    if (state is ResetPasswordSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Your email is existed")),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (context) => PasswordCodeCubit(),
                            child: VerificationCodeByEmail(
                              email: _emailController.text,
                            ),
                          ),
                        ),
                      );
                    }
                    if (state is ResetPasswordFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.myRed,
                          content: Text("Your email is not existed"),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return state is ResetPasswordLoading
                        ? Center(child: CircularProgressIndicator())
                        : SendCodeButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<ResetPasswordCubit>()
                                    .resetPassword(_emailController.text);
                              }
                            },
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
