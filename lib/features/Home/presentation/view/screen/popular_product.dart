import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_grid_view_home_page.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_row_home_page.dart';
import 'package:marketi/features/Home/presentation/view_model/all_product/cubit/all_product_cubit.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PopularProductBody());
  }
}

class PopularProductBody extends StatefulWidget {
  const PopularProductBody({super.key});

  @override
  State<PopularProductBody> createState() => _PopularProductBodyState();
}

class _PopularProductBodyState extends State<PopularProductBody> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Gap(50.h),
          CustomRowHomePage(text: "Popular Product", isSeen: true),
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
          // products
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: "All Products",
                fontSize: 22.s,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          BlocProvider(
            create: (context) => AllProductCubit(),
            child: CustomGridViewProductsPage(),
          ),
        ],
      ),
    );
  }
}
