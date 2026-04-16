// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi/features/Home/data/models/all_product_model.dart';
import 'package:meta/meta.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit() : super(AllProductInitial());

  Future<void> getAllProducts() async {
    emit(AllProductLoading());
    print("loading");
    try {
      var dio = Dio();
      // fetching products
      var response = await dio.get(
        "https://supermarket-dan1.onrender.com/api/v1/home/products?skip=1&limit=10",
        // queryParameters: {"skip": 1, "limit": 10},
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ZTBkMmRiYzM2MzQ2MDBjNzQ0OGZjNyIsImlhdCI6MTc3NjM0Mzc0NiwiZXhwIjoxNzc4OTM1NzQ2fQ.BMBcQ3W8adS9Q3jY9LCd0Dsj6FI8pfR3MIT8HO3z0lc",
          },
        ),
      );
      print("success");
      var product = ProductResponse.fromJson(response.data);
      // After fetching products successfully, emit the success state
      emit(AllProductSuccess(productResponse: product));
    } on DioException catch (e) {
      print("failure");
      // If there's an error, emit the error state with the error message
      emit(AllProductFailure(errorMessage: e.toString()));
    }
  }
}
