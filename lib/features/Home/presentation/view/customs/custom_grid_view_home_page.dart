import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view_model/all_product/cubit/all_product_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomGridViewProductsPage extends StatefulWidget {
  const CustomGridViewProductsPage({super.key});

  @override
  State<CustomGridViewProductsPage> createState() =>
      _CustomGridViewProductsPageState();
}

class _CustomGridViewProductsPageState
    extends State<CustomGridViewProductsPage> {
  // load like
  _loadLikeStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      likedIndexes =
          sharedPreferences
              .getStringList("likedIndex")
              ?.map((e) => int.parse(e))
              .toList() ??
          [];
    });
  }

  // toggle like
  _toggleLike() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      List<String> likedSaved = likedIndexes.map((e) => e.toString()).toList();
      sharedPreferences.setStringList("likedIndex", likedSaved);
    });
  }

  //
  // evaluation
  _loadEvaluateStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      evaluatedIndexes =
          sharedPreferences
              .getStringList("evaluatedIndexes")
              ?.map((e) => int.parse(e))
              .toList() ??
          [];
    });
  }

  // toggle like
  _toggleEvaluated() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      List<String> evaluateSaved = evaluatedIndexes
          .map((e) => e.toString())
          .toList();
      sharedPreferences.setStringList("evaluatedIndexes", evaluateSaved);
    });
  }

  List<int> likedIndexes = [];
  List<int> evaluatedIndexes = []; // 1
  @override
  void initState() {
    super.initState();
    context.read<AllProductCubit>().getAllProducts(14);
    _loadEvaluateStatus();
    _loadLikeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AllProductCubit, AllProductState>(
        builder: (context, state) {
          if (state is AllProductLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is AllProductSuccess) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.productResponse.list.length,
              itemBuilder: (context, index) {
                //final product = products[index];
                final isLiked = likedIndexes.contains(index);
                final isEvaluated = evaluatedIndexes.contains(index); //2
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
                                  state.productResponse.list[index].thumbnail
                                      .toString(),
                                  width: 190.w,
                                  height: 120.h,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  right: 3,
                                  top: 6,
                                  child: Container(
                                    width: 35.w,
                                    height: 35.h,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          if (likedIndexes.contains(index)) {
                                            likedIndexes.remove(index);
                                          } else {
                                            likedIndexes.add(index);
                                          }
                                        });
                                        await _toggleLike();
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(3.h),
                          Row(
                            children: [
                              CustomText(
                                text:
                                    "${state.productResponse.list[index].price} LE",
                                fontSize: 16.s,
                                color: AppColors.ContainerColorPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isEvaluated
                                        ? evaluatedIndexes.remove(index)
                                        : evaluatedIndexes.add(index);
                                    _toggleEvaluated();
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
                                text: state.productResponse.list[index].rating
                                    .toString(),
                                fontSize: 16.s,
                                color: AppColors.ContainerColorPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          CustomText(
                            text: state.productResponse.list[index].title,
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
          return Container();
        },
      ),
    );
  }
}
