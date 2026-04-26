import 'package:flutter/material.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';

class CustomColumnProfile extends StatelessWidget {
  const CustomColumnProfile({
    super.key,
    required this.title,
    required this.icon,
    this.widget,
    required this.isWidget,
  });
  final String title;
  final IconData icon;
  final Widget? widget;
  final bool isWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListTile(
        leading: Icon(icon, size: 30.w, color: AppColors.myNavy),
        title: CustomText(
          text: title,
          fontSize: 18.s,
          color: AppColors.myBlack,
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: isWidget
                ? widget
                : Icon(Icons.arrow_forward_ios_outlined, size: 25.w),
          ),
        ),
      ),
    );
  }
}
