import 'package:flutter/material.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';

class CustomTextFieldEmail extends StatefulWidget {
  const CustomTextFieldEmail({super.key, required this.emailController});
  final TextEditingController emailController;

  @override
  State<CustomTextFieldEmail> createState() => _CustomTextFieldEmailState();
}

class _CustomTextFieldEmailState extends State<CustomTextFieldEmail> {
  @override
  Widget build(BuildContext context) {
    return
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
          controller: widget.emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Email is required";
            }

            final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

            if (!emailRegex.hasMatch(value)) {
              return "Enter a valid email";
            }
            return null;
          },
        ),
      ],
    );
  }
}
