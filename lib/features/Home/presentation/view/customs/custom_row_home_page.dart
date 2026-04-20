import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/circle_avatar_custom.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/profile/presentation/view/profile_page.dart';
import 'package:marketi/features/profile/presentation/view_model/cubit/cubit/profile_cubit.dart';

class CustomRowHomePage extends StatelessWidget {
  const CustomRowHomePage({super.key, this.text, required this.isSeen});
  final String? text;
  final bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 52.w,
          height: 52.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.myBorderColor, width: 1),
            // color: AppColors.myBorderColor,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.ContainerColorPrimary,
            ),
          ),
        ),
        CustomText(
          text: text ?? "",
          fontSize: 22.s,
          color: AppColors.ContainerColorPrimary,
          fontWeight: FontWeight.bold,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (context) => ProfileCubit(),
                  child: ProfilePage(),
                ),
              ),
            );
          },
          child: isSeen
              ? CircleAvatarCustom(
                  h: 50.h,
                  w: 50.w,
                  imagePath: 'assets/images/Dod.png',
                )
              : Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_checkout_sharp,
                        weight: 50.w,
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 5,
                      child: Container(
                        width: 18.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: AppColors.myBlue,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 13.s,
                      top: 5.s,
                      child: CustomText(
                        text: "5",
                        fontSize: 15.s,
                        color: AppColors.myWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
