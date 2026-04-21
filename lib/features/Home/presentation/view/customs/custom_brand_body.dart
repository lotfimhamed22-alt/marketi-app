import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_brand_grid_view.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_row_home_page.dart';
import 'package:marketi/features/Home/presentation/view_model/brands/cubit/cubit/brands_cubit.dart';

class CustomBrandBody extends StatefulWidget {
  const CustomBrandBody({super.key});

  @override
  State<CustomBrandBody> createState() => _CustomBrandBodyState();
}

class _CustomBrandBodyState extends State<CustomBrandBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Gap(70.h),
            CustomRowHomePage(text: "Brands", isSeen: true),
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
            Gap(10.h),
            //
            // brand
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  text: "All Brands",
                  fontSize: 22.s,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Gap(10.h),
            BlocProvider(
              create: (context) => BrandsCubit(),
              child: CustomBrandGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
