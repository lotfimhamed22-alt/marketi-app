import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_container.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view_model/category/cubit/cubit/category_cubit.dart';

class CustomCategoryGridView extends StatefulWidget {
  const CustomCategoryGridView({super.key});

  @override
  State<CustomCategoryGridView> createState() => _CustomCategoryGridViewState();
}

class _CustomCategoryGridViewState extends State<CustomCategoryGridView> {
  @override
  void initState() {
    context.read<CategoryCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 305.h,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CategorySuccess) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.w,
                childAspectRatio: 0.85,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomContainer(
                        width: 230.w,
                        height: 126.h,
                        borderRadius: 8.r,
                        border: Border.all(
                          color: AppColors.myBorderColor,
                          width: 1.4.w,
                        ),

                        //color: AppColors.myBorderColor,
                        child: Image.network(
                          state.categoryResponse.list[index].image,
                          width: 155.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Gap(5.h),
                      CustomText(
                        text: state.categoryResponse.list[index].name,
                        fontSize: 18.s,
                        fontWeight: FontWeight.bold,
                        color: AppColors.ContainerColorPrimary,
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Container(child: Text("no categories found"));
        },
      ),
    );
  }
}
