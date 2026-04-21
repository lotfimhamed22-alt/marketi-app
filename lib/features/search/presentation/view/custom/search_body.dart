// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/customs/custom_text_form_field.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_row_home_page.dart';
import 'package:marketi/features/Home/presentation/view_model/category/cubit/cubit/category_cubit.dart';
import 'package:marketi/features/search/presentation/view/custom/category_search.dart';
import 'package:marketi/features/search/presentation/view/custom/custom_notfound_search.dart';
import 'package:marketi/features/search/presentation/view/custom/custom_products.dart';
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
          CustomRowHomePage(isSeen: false),
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
                      return CustomNotfoundSearch();
                    }
                    return isShown
                        ? Container()
                        : CustomProducts(filteredList: filteredList);
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
