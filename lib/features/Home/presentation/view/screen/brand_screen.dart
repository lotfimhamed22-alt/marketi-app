import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/Home/presentation/view/customs/custom_brand_body.dart';
import 'package:marketi/features/Home/presentation/view_model/brands/cubit/cubit/brands_cubit.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandsCubit(),
      child: CustomBrandBody(),
    );
  }
}
