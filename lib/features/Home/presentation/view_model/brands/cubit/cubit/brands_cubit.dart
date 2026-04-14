// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi/features/Home/data/models/brand_model.dart';
import 'package:meta/meta.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit() : super(BrandsInitial());

  Future<void> getBrands() async {
    emit(BrandsLoading());
    print("loading brands");
    try {
      var dio = Dio();
      var response = await dio.get(
        "https://supermarket-dan1.onrender.com/api/v1/home/brands",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ZGNhMmE2YWZmZDZiNjE3Y2EwNzA5NSIsImlhdCI6MTc3NjA2NzI5MiwiZXhwIjoxNzc4NjU5MjkyfQ.Ug7fnPqyAj5g1PpJqHIlKyJfhMIvlJLWs8_s5Ny5Q4M",
          },
        ),
      );
      var brand = BrandResponse.fromJson(response.data);
      emit(BrandsSuccess(brand: brand));
      print("success brand");
    } on DioException catch (e) {
      print("fail brand");
      emit(BrandsFailure(errorMessage: e.message.toString()));
    }
  }
}
