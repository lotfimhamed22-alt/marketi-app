// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/constants/route_constants.dart';
import 'package:marketi/features/splash/splash_ui.dart';

class SplashLogic extends StatefulWidget {
  const SplashLogic({super.key});

  @override
  State<SplashLogic> createState() => _SplashUiState();
}

class _SplashUiState extends State<SplashLogic> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),
      () => context.pushReplacement(RouteConstants.onBoarding),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashUi();
  }
}
