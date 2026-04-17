import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_row_home_page.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchBody());
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(children: [Gap(50.h), CustomRowHomePage(isSeen: true)]),
    );
  }
}
