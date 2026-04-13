import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/customs/custom_image_on_boarding.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/auth/presentation/view_model/sign_up_cubit/cubit/sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isSeen = true;
  bool isSeenConfirm = true;
  bool isCkecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.myWhite,
        body: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                children: [
                  Gap(50.h),
                  CustomImageOnBoarding(
                    image: "assets/logo/logo.png",
                    width: 217.59.w,
                    height: 190.h,
                  ),
                  // your name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Your Name",
                        fontSize: 16.5.s,
                        fontWeight: FontWeight.w600,
                        color: AppColors.ContainerColorPrimary,
                      ),
                      CustomTextFormField(
                        readOnly: false,
                        hintText: 'Full Name',
                        prefixIcon: Icons.person_outline,
                        controller: _fullNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Full Name is required";
                          }

                          if (value.length < 3) {
                            return "Full Name must be at least 3 characters";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  Gap(16.h),
                  // user name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Username",
                        fontSize: 16.5.s,
                        fontWeight: FontWeight.w600,
                        color: AppColors.ContainerColorPrimary,
                      ),
                      CustomTextFormField(
                        readOnly: false,

                        hintText: 'Username',
                        prefixIcon: Icons.person_outline,
                        controller: _userNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username is required";
                          }

                          if (value.length < 3) {
                            return "Username must be at least 3 characters";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  Gap(16.h),
                  // phone number
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Phone Number",
                        fontSize: 16.5.s,
                        fontWeight: FontWeight.w600,
                        color: AppColors.ContainerColorPrimary,
                      ),
                      CustomTextFormField(
                        readOnly: false,

                        hintText: '+20 1501142409 ',
                        prefixIcon: Icons.phone_android_outlined,
                        controller: _phoneNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone number is required";
                          }

                          final phoneRegex = RegExp(r"^\+?[0-9]{10,14}$");

                          if (!phoneRegex.hasMatch(value)) {
                            return "Enter a valid phone number";
                          }
                          if (value.length < 10 || value.length > 14) {
                            return "Phone number must be between 10 and 14 digits";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  Gap(16.h),
                  // email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Email",
                        fontSize: 16.5.s,
                        fontWeight: FontWeight.w600,
                        color: AppColors.ContainerColorPrimary,
                      ),
                      CustomTextFormField(
                        readOnly: false,

                        hintText: 'You@gmail.com',
                        prefixIcon: Icons.email_outlined,
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }

                          final emailRegex = RegExp(
                            r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                          );

                          if (!emailRegex.hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  Gap(16.h),
                  // password
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
                  Gap(30.h),
                  BlocConsumer<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Sign Up Successfully")),
                        );
                        Navigator.pop(context);
                      }
                      if (state is SignUpFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Sign Up failed")),
                        );
                      }
                    },
                    builder: (context, state) {
                      return state is SignUpLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.ContainerColorPrimary,
                              ),
                            )
                          : CustomButton(
                              text: "Sign Up",
                              fontSize: 20.s,
                              colorText: AppColors.myWhite,
                              colorBackGroundButton: AppColors.myBlue,
                              fontWeight: FontWeight.w800,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignUpCubit>().signUp(
                                    _userNameController.text,
                                    _phoneNumberController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                    _confirmPasswordController.text,
                                  );
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
      ),
    );
  }
}
