// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/onboarding/presentation/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300.17.w,
              child: Image.asset("assets/logo/logo.png"),
            ),
          ],
        ),
      ),
    );
  }
}
