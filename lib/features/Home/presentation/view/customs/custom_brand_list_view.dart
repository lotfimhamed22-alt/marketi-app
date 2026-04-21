// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_container.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view_model/brands/cubit/cubit/brands_cubit.dart';

class CustomBrandListView extends StatefulWidget {
  final Axis scrollDirection;
  const CustomBrandListView({super.key, required this.scrollDirection});
  @override
  State<CustomBrandListView> createState() => _CustomBrandListViewState();
}

class _CustomBrandListViewState extends State<CustomBrandListView> {
  @override
  void initState() {
    context.read<BrandsCubit>().getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        if (state is BrandsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is BrandsSuccess) {
          return SizedBox(
            height: 116.h,
            child: ListView.builder(
              scrollDirection: widget.scrollDirection,
              itemCount: state.brand.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomContainer(
                    width: 150.w,
                    height: 126.h,
                    borderRadius: 8.r,
                    alignment: Alignment.center,
                    border: Border.all(
                      color: AppColors.myBorderColor,
                      width: 1.4.w,
                    ),
                    child: CustomText(
                      text: state.brand.list[index].emoji,
                      fontSize: 50.s,
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container(child: Text("no brands"));
      },
    );
  }
}
