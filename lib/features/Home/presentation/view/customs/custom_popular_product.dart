import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/core/services/chash_helper.dart';
import 'package:marketi/core/services/service_locator.dart';
import 'package:marketi/features/Home/presentation/view_model/all_product/cubit/all_product_cubit.dart';

class CustomPopularProduct extends StatefulWidget {
  const CustomPopularProduct({super.key});

  @override
  State<CustomPopularProduct> createState() => _CustomPopularProductState();
}

class _CustomPopularProductState extends State<CustomPopularProduct> {
  List<int> likedIndexes = [];
  List<int> evaluatedIndexes = [];

  final cache = getIt<ChashHelper>();

  @override
  void initState() {
    super.initState();

    context.read<AllProductCubit>().getAllProducts(3);

    /// ✅ liked
    final likedData = (cache.getData(key: "likedIndexes")).cast<String>();

    likedIndexes = likedData.map((e) => int.parse(e)).toList();

    /// ✅ evaluated
    final evaluatedData = (cache.getData(
      key: "evaluatedIndexes",
    )).cast<String>();

    evaluatedIndexes = evaluatedData.map((e) => int.parse(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 187.h,
      child: BlocBuilder<AllProductCubit, AllProductState>(
        builder: (context, state) {
          if (state is AllProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AllProductSuccess) {
            final products = state.productResponse.list;

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                final isLiked = likedIndexes.contains(product.id);

                final isEvaluated = evaluatedIndexes.contains(product.id);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Container(
                    width: 200.w,
                    height: 187.h,
                    decoration: BoxDecoration(
                      color: AppColors.myWhite,
                      borderRadius: BorderRadius.circular(6.r),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade200, blurRadius: 19),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// image + like
                          Container(
                            width: 190.w,
                            height: 120.h,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundProductColor,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Stack(
                              children: [
                                Image.network(
                                  product.thumbnail,
                                  width: 190.w,
                                  height: 120.h,
                                  fit: BoxFit.cover,
                                ),

                                Positioned(
                                  right: 3,
                                  top: 6,
                                  child: GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        if (isLiked) {
                                          likedIndexes.remove(product.id);
                                        } else {
                                          likedIndexes.add(product.id);
                                        }
                                      });

                                      await cache.saveData(
                                        key: "likedIndexes",
                                        value: likedIndexes
                                            .map((e) => e.toString())
                                            .toList(),
                                      );
                                    },
                                    child: Container(
                                      width: 35.w,
                                      height: 35.h,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        isLiked
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: isLiked
                                            ? Colors.red
                                            : AppColors.ContainerColorPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Gap(3.h),

                          /// price + rating
                          Row(
                            children: [
                              CustomText(
                                text: "${product.price} LE",
                                fontSize: 16.s,
                                color: AppColors.ContainerColorPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),

                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    if (isEvaluated) {
                                      evaluatedIndexes.remove(product.id);
                                    } else {
                                      evaluatedIndexes.add(product.id);
                                    }
                                  });

                                  await cache.saveData(
                                    key: "evaluatedIndexes",
                                    value: evaluatedIndexes
                                        .map((e) => e.toString())
                                        .toList(),
                                  );
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
                                text: product.rating.toString(),
                                fontSize: 16.s,
                                color: AppColors.ContainerColorPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),

                          CustomText(
                            text: product.title,
                            fontSize: 16.s,
                            color: AppColors.ContainerColorPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: Text("Failed to load products"));
        },
      ),
    );
  }
}
