// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_row_home_page.dart';
import 'package:marketi/features/Home/presentation/view_model/category/cubit/cubit/category_cubit.dart';
import 'package:marketi/features/search/presentation/view/custom/category_search.dart';
import 'package:marketi/features/search/presentation/view_model/cubit/search_cubit.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  bool isShown = false;

  final TextEditingController _searchController = TextEditingController();
  Set<int> likedIndexes = {};
  Set<int> evaluatedIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Gap(50.h),
          CustomRowHomePage(isSeen: true),
          Gap(20.h),
          CustomTextFormField(
            readOnly: false,
            prefixIcon: Icons.search,
            controller: _searchController,
            hintText: "What are you looking for ? ",
            suffixIcon: Icons.tune_outlined,
            suffixColor: AppColors.myBlue,
            onChanged: (value) {
              if (value.trim().isNotEmpty) {
                context.read<SearchCubit>().searchProduct(value);
              } else {
                setState(() {});
              }
            },
          ),
          Gap(10.h),
          // search categories
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Popular Search",
                    fontSize: 20.s,
                    fontWeight: FontWeight.bold,
                  ),
                  IconButton(
                    onPressed: () {
                      isShown = !isShown;
                      setState(() {});
                    },
                    icon: isShown
                        ? Icon(Icons.arrow_left_outlined, size: 47.w)
                        : Icon(Icons.arrow_drop_down_outlined, size: 47.w),
                  ),
                ],
              ),
              //
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (_searchController.text.isEmpty) {
                    return BlocProvider(
                      create: (context) => CategoryCubit(),
                      child: CategorySearch(isShown: isShown),
                    );
                  }
                  if (state is SearchLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is SearchSuccess) {
                    final query = _searchController.text.toLowerCase();

                    final filteredList = state.search.list.where((product) {
                      return product.title.toLowerCase().startsWith(query) ||
                          product.category.toLowerCase().startsWith(query) ||
                          product.brand.toLowerCase().startsWith(query);
                    }).toList();
                    if (filteredList.isEmpty) {
                      return Center(child: Text("product not found"));
                    }
                    return isShown
                        ? Container()
                        : SizedBox(
                            height: 730.h,

                            width: 500.w,
                            child: ListView.builder(
                              // scrollDirection: Axis.vertical,
                              itemCount: filteredList.length,
                              itemBuilder: (context, index) {
                                // st
                                // final search = state.search.list[index];
                                final isLiked = likedIndexes.contains(index);
                                final isEvaluated = evaluatedIndexes.contains(
                                  index,
                                ); //2
                                return Container(
                                  // height: 120.h,
                                  // width: 100.w,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            filteredList[index].thumbnail,
                                            width: 150.w,
                                          ),
                                          // Gap(10.h),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomText(
                                                    text: filteredList[index]
                                                        .category,
                                                    fontSize: 18.s,
                                                    fontWeight: FontWeight.bold,
                                                  ),

                                                  Gap(160.w),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (likedIndexes
                                                            .contains(index)) {
                                                          likedIndexes.remove(
                                                            index,
                                                          );
                                                        } else {
                                                          likedIndexes.add(
                                                            index,
                                                          );
                                                        }
                                                      });
                                                    },
                                                    child: Icon(
                                                      isLiked
                                                          ? Icons.favorite
                                                          : Icons
                                                                .favorite_border,
                                                      color: isLiked
                                                          ? Colors.red
                                                          : AppColors
                                                                .ContainerColorPrimary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Gap(5.h),
                                              CustomText(
                                                text: filteredList[index].title,
                                                fontSize: 15.s,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              // Gap(10.h),
                                              CustomText(
                                                text: filteredList[index].brand,
                                                fontSize: 15.s,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              // Gap(10.h),
                                              Row(
                                                children: [
                                                  CustomText(
                                                    text:
                                                        "${filteredList[index].price} LE",
                                                    fontSize: 16.s,
                                                    color: AppColors
                                                        .ContainerColorPrimary,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  Gap(160.w),
                                                  // Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isEvaluated
                                                            ? evaluatedIndexes
                                                                  .remove(index)
                                                            : evaluatedIndexes
                                                                  .add(index);
                                                      });
                                                    },
                                                    child: Icon(
                                                      isEvaluated
                                                          ? Icons.star
                                                          : Icons.star_outline,
                                                      color: isEvaluated
                                                          ? AppColors.myBlue
                                                          : AppColors
                                                                .ContainerColorPrimary,
                                                      size: 24.s,
                                                    ),
                                                  ),
                                                  CustomText(
                                                    text: filteredList[index]
                                                        .rating
                                                        .toString(),
                                                    fontSize: 16.s,
                                                    color: AppColors
                                                        .ContainerColorPrimary,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 30.h,
                                        color: AppColors.myNavy,
                                        thickness: 1.s,
                                        indent: 20,
                                        endIndent: 20,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                  }
                  return Container(child: Text("Retry"));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
