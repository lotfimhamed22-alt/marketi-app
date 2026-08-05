import 'package:flutter/material.dart';
import 'package:marketi/core/constants/app_size.dart';
import 'package:marketi/core/constants/assets_constants.dart';

class SplashUi extends StatelessWidget {
  const SplashUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsConstants.logo, width: AppSize.width * 0.4),
          ],
        ),
      ),
    );
  }
}
