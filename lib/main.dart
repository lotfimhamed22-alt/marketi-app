import 'package:flutter/material.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/features/start-up/splash/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.myWhite,
        fontFamily: "poppins",
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
