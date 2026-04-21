import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marketi/bottom_navigation_bar.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/constants/strings/strings.dart';
import 'package:marketi/features/cart/data/models/product_model_cart.dart';
import 'package:marketi/features/splash/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductResponseAdapter());
  await Hive.openBox<ProductResponseCart>(product);
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
