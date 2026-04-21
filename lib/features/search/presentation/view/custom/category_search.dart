// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view_model/category/cubit/cubit/category_cubit.dart';

class CategorySearch extends StatefulWidget {
  final bool isShown;
  const CategorySearch({super.key, required this.isShown});

  @override
  State<CategorySearch> createState() => _GridviewPaginationState();
}

class _GridviewPaginationState extends State<CategorySearch> {
  @override
  void initState() {
    context.read<CategoryCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return state is CategoryLoading
            ? Center(child: CircularProgressIndicator())
            : Wrap(
                spacing: 15.w,
                runSpacing: 15.h,
                children: List.generate(
                  state is CategorySuccess
                      ? state.categoryResponse.list.length
                      : 6,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        print(
                          state is CategorySuccess
                              ? state.categoryResponse.list[index].name
                              : "",
                        );
                      },
                      child: widget.isShown
                          ? Container()
                          : Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: CustomText(
                                text: state is CategorySuccess
                                    ? state.categoryResponse.list[index].name
                                    : "",
                                fontSize: 18.s,
                                color: AppColors.paginationColor,
                              ),
                            ),
                    );
                  },
                ),
              );
      },
    );
  }
}
