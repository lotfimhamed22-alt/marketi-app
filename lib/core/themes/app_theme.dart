import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/themes/app_colors.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: "poppins",
      scaffoldBackgroundColor: AppColors.myWhite,
      textTheme: TextTheme(
        bodyMedium: TextStyle(fontSize: 14.sp, color: AppColors.myNavy),
      ),

      colorScheme: ColorScheme.light(
        primary: AppColors.ContainerColorPrimary,
        secondary: AppColors.ContainerColorSecondry,
        error: AppColors.myRed,
      ),

      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.light_blue,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.myWhite,
        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: AppColors.myWhite,
        ),
      ),
    );
  }
}
