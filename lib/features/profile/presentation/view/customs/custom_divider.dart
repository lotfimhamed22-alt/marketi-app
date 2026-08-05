import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.shade400,
      endIndent: 20.w,
      indent: 20.w,
      // height: 0.h,
    );
  }
}
