import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constants/app_colors.dart';
import 'package:marketi/core/customs/circle_avatar_custom.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/profile/presentation/view/profile_page.dart';
import 'package:marketi/features/profile/presentation/view_model/cubit/cubit/profile_cubit.dart';

class CustomRowHomePage extends StatelessWidget {
  const CustomRowHomePage({super.key, this.text});
  final String? text;

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
          child: CircleAvatarCustom(
            h: 50.h,
            w: 50.w,
            imagePath: 'assets/images/Dod.png',
          ),
        ),
      ],
    );
  }
}
