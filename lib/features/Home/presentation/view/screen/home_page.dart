import 'package:flutter/material.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/features/Home/presentation/view/customs/home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.myWhite, body: HomePageBody());
  }
}
