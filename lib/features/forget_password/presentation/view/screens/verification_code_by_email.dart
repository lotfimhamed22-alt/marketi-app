import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/forget_password/presentation/view/customs/custom_app_bar_forget_password_screen.dart';
import 'package:marketi/features/forget_password/presentation/view/screens/new_password.dart';
import 'package:marketi/features/forget_password/presentation/view_model/reset_code/cubit/password_code_cubit.dart';

class VerificationCodeByEmail extends StatefulWidget {
  const VerificationCodeByEmail({super.key, required this.email});
  final String email;

  @override
  State<VerificationCodeByEmail> createState() =>
      _VerificationCodeByEmailState();
}

class _VerificationCodeByEmailState extends State<VerificationCodeByEmail> {
  String codeValid = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Gap(60.h),
            CustomAppBarForgetPasswordScreen(),
            Gap(80.h),
            Image.asset(
              "assets/images/forget_password/Verification_Code_With_Email.png",
              width: 380.w,
            ),
            Gap(40.h),
            CustomText(
              text:
                  "Please enter the 6 digit code\n\t\t\tsent to: ${widget.email}",
              fontSize: 18.s,
              fontWeight: FontWeight.w500,
              color: AppColors.myNavy,
            ),
            Gap(20.h),
            // otp text field
            OtpTextField(
              numberOfFields: 6,
              borderColor: Color(0xFF512DA8),
              fieldWidth: 60.w,

              // borderWidth: 60.w,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,

              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },

              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                codeValid = verificationCode;
              }, // end onSubmit
            ),
            Gap(20.h),
            // custom button
            BlocConsumer<PasswordCodeCubit, PasswordCodeState>(
              listener: (context, state) {
                if (state is PasswordCodeSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.myBlue,
                      content: Text("sended code"),
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => NewPassword()),
                  );
                }
                if (state is PasswordCodeFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.myRed,
                      content: Text("Code is wrong , try again"),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return state is PasswordCodeLoding
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton(
                        text: "Verify Code",
                        fontSize: 22.s,
                        fontWeight: FontWeight.bold,
                        colorText: AppColors.myWhite,
                        colorBackGroundButton: AppColors.myBlue,
                        onPressed: () {
                          print(codeValid);
                          context.read<PasswordCodeCubit>().resetPasswordCode(
                            codeValid,
                            widget.email,
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
