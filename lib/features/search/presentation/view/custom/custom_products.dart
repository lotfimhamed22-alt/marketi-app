// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_button.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/cart/data/models/product_model_cart.dart';
import 'package:marketi/features/cart/presentation/view_model/cubit/add_cart/cubit/add_product_cubit.dart';
import 'package:marketi/features/search/presentation/view/custom/custom_divider.dart';

class CustomProducts extends StatefulWidget {
  const CustomProducts({super.key, required this.filteredList});
  final List filteredList;

  @override
  State<CustomProducts> createState() => _CustomProductsState();
}

class _CustomProductsState extends State<CustomProducts> {
  Set<int> likedIndexes = {};

  Set<int> evaluatedIndexes = {};

  Set<int> isAddedIndex = {}; // 1
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 730.h,
      width: 500.w,
      child: ListView.builder(
        // scrollDirection: Axis.vertical,
        itemCount: widget.filteredList.length,
        itemBuilder: (context, index) {
          // final search = state.search.list[index];
          final isLiked = likedIndexes.contains(index);
          final isEvaluated = evaluatedIndexes.contains(index); //2
          final isAdded = isAddedIndex.contains(index); //3
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      widget.filteredList[index].thumbnail,
                      width: 150.w,
                    ),
                    // Gap(10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: widget.filteredList[index].category,
                              fontSize: 18.s,
                              fontWeight: FontWeight.bold,
                            ),

                            Gap(180.w),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (likedIndexes.contains(index)) {
                                    likedIndexes.remove(index);
                                  } else {
                                    likedIndexes.add(index);
                                  }
                                });
                              },
                              child: Icon(
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isLiked
                                    ? Colors.red
                                    : AppColors.ContainerColorPrimary,
                              ),
                            ),
                          ],
                        ),
                        Gap(5.h),
                        CustomText(
                          text: widget.filteredList[index].title,
                          fontSize: 15.s,
                          fontWeight: FontWeight.bold,
                        ),
                        // Gap(10.h),
                        CustomText(
                          text: widget.filteredList[index].brand,
                          fontSize: 15.s,
                          fontWeight: FontWeight.bold,
                        ),
                        // Gap(10.h),
                        Row(
                          children: [
                            CustomText(
                              text: "${widget.filteredList[index].price} LE",
                              fontSize: 16.s,
                              color: AppColors.ContainerColorPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                            Gap(160.w),
                            // Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEvaluated
                                      ? evaluatedIndexes.remove(index)
                                      : evaluatedIndexes.add(index);
                                });
                              },
                              child: Icon(
                                isEvaluated ? Icons.star : Icons.star_outline,
                                color: isEvaluated
                                    ? AppColors.myBlue
                                    : AppColors.ContainerColorPrimary,
                                size: 24.s,
                              ),
                            ),
                            CustomText(
                              text: widget.filteredList[index].rating
                                  .toString(),
                              fontSize: 16.s,
                              color: AppColors.ContainerColorPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        Gap(15.h),
                        BlocProvider(
                          create: (context) => AddProductCubit(),
                          child: Container(
                            width: 290.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.myBlue),
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child:
                                BlocConsumer<AddProductCubit, AddProductState>(
                                  listener: (context, state) {
                                    if (state is AddProductFailure) {
                                      print("fail save");
                                    }
                                    //
                                    if (state is AddProductSuccess) {
                                      print("Success save");
                                    }
                                  },
                                  builder: (context, state) {
                                    return state is AddProductLoading
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : CustomButton(
                                            text: isAdded ? "✔️" : "Add",
                                            fontSize: 20.s,
                                            fontWeight: FontWeight.w400,
                                            colorText: AppColors.myBlue,
                                            colorBackGroundButton: isAdded
                                                ? Colors.green
                                                : null,
                                            onPressed: () {
                                              if (isAdded == false) {
                                                context
                                                    .read<AddProductCubit>()
                                                    .addProduct(
                                                      ProductResponseCart(
                                                        list: [],
                                                        total: 0,
                                                        skip: 0,
                                                        limit: 10,
                                                      ),
                                                    );
                                              }
                                              setState(() {
                                                isAdded
                                                    ? isAddedIndex.remove(index)
                                                    : isAddedIndex.add(index);
                                              });
                                            },
                                          );
                                  },
                                ),
                          ),
                        ),
                        //
                      ],
                    ),
                  ],
                ),
                CustomDivider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
