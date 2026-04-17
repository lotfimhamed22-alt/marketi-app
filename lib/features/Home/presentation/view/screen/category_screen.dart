import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_category_grid_view.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_row_home_page.dart';
import 'package:marketi/features/Home/presentation/view_model/category/cubit/cubit/category_cubit.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Gap(50.h),
            CustomRowHomePage(text: "Categories", isSeen: true),
            Gap(20.h),
            // search
            CustomTextFormField(
              readOnly: true,
              prefixIcon: Icons.search,
              controller: _searchController,
              hintText: "What are you looking for ? ",
              suffixIcon: Icons.tune_outlined,
              suffixColor: AppColors.myBlue,
            ),
            //
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  text: "All Categories",
                  fontSize: 22.s,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            //Gap(5.h),
            BlocProvider(
              create: (context) => CategoryCubit(),
              child: CustomCategoryGridView(
                crossAxisCount: 2,
                height: 750.h,
                childAspectRatio: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
