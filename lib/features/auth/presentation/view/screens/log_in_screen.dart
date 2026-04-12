// ignore_for_file: unnecessary_import

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/api/dio_consumer.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/customs/custom_row_text.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/core/customs/custom_image_on_boarding.dart';
import 'package:marketi/features/Home/presentation/view/home_page.dart';
import 'package:marketi/features/auth/presentation/view/screens/sign_up_screen.dart';
import 'package:marketi/features/auth/presentation/view_model/sign_up_cubit/cubit/sign_up_cubit.dart';
import 'package:marketi/features/auth/presentation/view_model/signin_cubit/cubit/sign_in_cubit.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isSeen = true;
  bool isCkecked = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.myWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _formKey,
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
                Gap(16.h),
                CustomTextFormField(
                  lableText: 'Password',
                  prefixIcon: Icons.lock_outlined,
                  controller: _passwordController,
                  obscureText: !isSeen,
                  suffixIcon: isSeen
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  onTap: () {
                    isSeen = !isSeen;
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }

                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
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
                BlocConsumer<SignInCubit, SignInState>(
                  listener: (context, state) {
                    if (state is SignInSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Successfully")),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    }
                    if (state is SignInFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.myRed,
                          content: Text(
                            "You Don't Have An Account , register now",
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return state is SignInLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomButton(
                            text: "Log In",
                            fontSize: 20.s,
                            colorText: AppColors.myWhite,
                            colorBackGroundButton: isCkecked
                                ? AppColors.myBlue
                                : Colors.grey.shade400,
                            fontWeight: FontWeight.w800,
                            onPressed: () {
                              if (isCkecked == true) {
                                _formKey.currentState!.validate();
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignInCubit>().signIn(
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                                }
                              }
                            },
                          );
                  },
                ),
                Gap(35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Are you new in Marketi ",
                      fontSize: 16.s,
                      color: AppColors.myNavy,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) =>
                                  SignUpCubit(DioConsumer(dio: Dio())),
                              child: SignUpScreen(),
                            ),
                          ),
                        );
                      },
                      child: CustomText(
                        text: "register?",
                        fontSize: 16.s,
                        color: AppColors.light_blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
