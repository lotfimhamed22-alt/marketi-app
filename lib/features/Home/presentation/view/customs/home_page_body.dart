import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/circle_avatar_custom.dart';
import 'package:marketi/core/customs/custom_image_on_boarding.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_brand_list_view.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_category_grid_view.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_popular_product.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_row_name_offer.dart';
import 'package:marketi/features/Home/presentation/view/screen/brand_screen.dart';
import 'package:marketi/features/Home/presentation/view/screen/category_screen.dart';
import 'package:marketi/features/Home/presentation/view/screen/popular_product.dart';
import 'package:marketi/features/Home/presentation/view_model/brands/cubit/cubit/brands_cubit.dart';
import 'package:marketi/features/Home/presentation/view_model/category/cubit/cubit/category_cubit.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Gap(50.h),
          // appbar
          Row(
            children: [
              CircleAvatarCustom(
                h: 50.h,
                w: 50.w,
                imagePath: 'assets/images/Dod.png',
              ),
              Gap(20.h),
              CustomText(
                text: "Hi lotfi !",
                fontSize: 20,
                color: AppColors.ContainerColorPrimary,
              ),
              Spacer(),
              SvgPicture.asset("assets/icons/Bell.svg"),
            ],
          ),
          Gap(20.h),
          // seach
          CustomTextFormField(
            readOnly: true,
            prefixIcon: Icons.search,
            controller: _searchController,
            hintText: "What are you looking for ? ",
            suffixIcon: Icons.tune_outlined,
            suffixColor: AppColors.myBlue,
          ),
          Gap(5.h),
          SizedBox(
            height: 705.h,
            child: ListView(
              children: [
                // offer_1
                CustomImageOnBoarding(image: "assets/logo/Offer_1.png"),
                Gap(15.h),
                // popular products
                CustomRowNameOffer(
                  text: "Popular Product",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PopularProduct()),
                    );
                  },
                ),
                // all products
                Gap(10.h),
                // popular product
                CustomPopularProduct(),
                Gap(10.h),
                // category
                CustomRowNameOffer(
                  text: "Category",
                  onTap: () {
                    Navigator.push(
                      context,
                      (MaterialPageRoute(builder: (_) => CategoryScreen())),
                    );
                  },
                ),
                Gap(10.h),
                // category custom
                BlocProvider(
                  create: (context) => CategoryCubit(),
                  child: CustomCategoryGridView(
                    crossAxisCount: 3,
                    height: 305.h,
                    childAspectRatio: .99,
                  ),
                ),
                Gap(10.h),
                // brand
                CustomRowNameOffer(
                  text: "Brands",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BrandScreen()),
                    );
                  },
                ),
                Gap(10.h),
                // category custom
                BlocProvider(
                  create: (context) => BrandsCubit(),
                  child: CustomBrandListView(scrollDirection: Axis.horizontal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
