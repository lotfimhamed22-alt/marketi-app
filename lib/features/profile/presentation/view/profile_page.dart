// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi/features/profile/presentation/view_model/cubit/cubit/profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("sucess")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Gap(330),
                TextButton(
                  onPressed: () {
                    context.read<ProfileCubit>().getProfileData();
                    if (state is ProfileSuccess) {
                      print("name user is ${state.profile.user.name}");
                    }
                  },
                  child: Text("get progile data"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
