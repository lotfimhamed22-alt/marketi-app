import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/circle_avatar_custom.dart';
import 'package:marketi/core/customs/custom_image_on_boarding.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_popular_product.dart';
import 'package:marketi/features/Home/presentation/view/screen/popular_product.dart';

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
      child: ListView(
        children: [
          Gap(20.h),
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
          Gap(15.h),
          // offer_1
          CustomImageOnBoarding(
            image: "assets/logo/Offer_1.png",
            // width: 347.w,
            // height: 150.h,
          ),
          Gap(15.h),
          // popular products
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Popular Product",
                fontSize: 20.s,
                color: AppColors.myBlack,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PopularProduct()),
                  );
                },
                child: CustomText(
                  text: "View all",
                  fontSize: 16.s,
                  color: AppColors.myBlue,
                ),
              ),
            ],
          ),
          // all products
          Gap(10.h),
          // popular product
          CustomPopularProduct(),
        ],
      ),
    );
  }
}
