// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';

class CustomTextFieldPhoneNumberForgetPassword extends StatefulWidget {
  const CustomTextFieldPhoneNumberForgetPassword({super.key});

  @override
  State<CustomTextFieldPhoneNumberForgetPassword> createState() =>
      _CustomTextFieldPhoneNumberState();
}

class _CustomTextFieldPhoneNumberState
    extends State<CustomTextFieldPhoneNumberForgetPassword> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Phone Number",
          fontSize: 16.s,
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
    );
  }
}
