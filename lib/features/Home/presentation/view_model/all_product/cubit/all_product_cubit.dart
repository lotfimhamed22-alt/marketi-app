// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/network/errors/exceptions.dart';
import 'package:marketi/features/Home/data/models/all_product_model.dart';
import 'package:meta/meta.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit() : super(AllProductInitial());

  Future<void> getAllProducts() async {
    emit(AllProductLoading());
    try {
      var dio = Dio();
      // fetching products
      final response = await dio.get(
        "https://supermarket-dan1.onrender.com/api/v1/home/products?skip=1&limit=10",
        queryParameters: {
          "skip": 1,
          "limit": 10,
          "sortBy": "title",
          "order": "asc",
          "select": "title,price",
        },
      );
      var product = ProductResponse.fromJson(response.data);
      // After fetching products successfully, emit the success state
      emit(AllProductSuccess(productResponse: product));
    } on ServerException catch (e) {
      // If there's an error, emit the error state with the error message
      emit(AllProductFailure(errorMessage: e.toString()));
    }
  }
}
