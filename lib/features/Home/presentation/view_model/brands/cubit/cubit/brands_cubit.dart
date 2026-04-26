// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/services/chash_helper.dart';
import 'package:marketi/core/services/service_locator.dart';
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
            "Authorization": "Bearer ${getIt<ChashHelper>().getToken()}",
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
