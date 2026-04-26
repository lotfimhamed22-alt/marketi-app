// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/core/constants/colors/app_colors.dart';
import 'package:marketi/core/customs/custom_text.dart';
import 'package:marketi/core/responsive/extensions.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_row_home_page.dart';
import 'package:marketi/features/profile/presentation/view/customs/custom_column_profile.dart';
import 'package:marketi/features/profile/presentation/view_model/cubit/cubit/profile_cubit.dart';
import 'package:marketi/features/search/presentation/view/custom/custom_divider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: ProfileBody(),
    );
  }
}

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool isSwitched = false;
  @override
  void initState() {
    context.read<ProfileCubit>().getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwitched ? AppColors.myBlack : null,

      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProfileFailure) {
            print("no profile");
          }
          if (state is ProfileSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Gap(50.h),
                  CustomRowHomePage(text: "Popular Product", isSeen: false),
                  Gap(30.h),
                  SizedBox(
                    height: 220.h,
                    width: 220.w,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/Dod.png"),
                    ),
                  ),
                  Gap(15.h),
                  CustomText(
                    text: state.profile.user.name,
                    fontSize: 25.s,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: state.profile.user.email,
                    fontSize: 20.s,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomColumnProfile(
                    title: "Account Preferences",
                    icon: Icons.person_2_outlined,
                    isWidget: false,
                  ),
                  CustomDivider(),
                  CustomColumnProfile(
                    title: "Subscription & Payment",
                    icon: Icons.payment_outlined,
                    isWidget: false,
                  ),
                  CustomDivider(),
                  CustomColumnProfile(
                    title: "Dark Mode",
                    icon: Icons.dark_mode_outlined,
                    isWidget: true,
                    widget: Switch(
                      activeThumbColor: AppColors.myBlue,
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = !isSwitched;
                        });
                      },
                    ),
                  ),
                  CustomDivider(),
                ],
              ),
            );
          }
          return Container(child: Center(child: Text("no daaa")));
        },
      ),
    );
  }
}
