// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/custom_container.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view_model/brands/cubit/cubit/brands_cubit.dart';

class CustomBrandGridView extends StatefulWidget {
  const CustomBrandGridView({super.key});

  @override
  State<CustomBrandGridView> createState() => _CustomBrandGridViewState();
}

class _CustomBrandGridViewState extends State<CustomBrandGridView> {
  @override
  void initState() {
    context.read<BrandsCubit>().getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BrandsCubit, BrandsState>(
        builder: (context, state) {
          if (state is BrandsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BrandsSuccess) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.w,
                childAspectRatio: 1.4.s,
              ),
              itemCount: state.brand.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomContainer(
                        width: 230.w,
                        height: 126.h,
                        borderRadius: 8.r,
                        alignment: Alignment.center,
                        border: Border.all(
                          color: AppColors.myBorderColor,
                          width: 1.4.w,
                        ),
                        //color: AppColors.myBorderColor,
                        child: CustomText(
                          text: state.brand.list[index].emoji,
                          fontSize: 50.s,
                        ),
                      ),
                      Gap(8.h),
                      CustomText(
                        text: state.brand.list[index].name,
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
