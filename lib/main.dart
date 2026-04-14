import 'package:flutter/material.dart';
import 'package:marketi/bottom_navigation_bar.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/features/Home/presentation/view/screen/home_page.dart';

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
      home: BottomNavigationBarR(),
      debugShowCheckedModeBanner: false,
    );
  }
}
