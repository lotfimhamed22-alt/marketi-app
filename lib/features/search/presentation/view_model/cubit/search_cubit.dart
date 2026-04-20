// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi/features/Home/data/models/all_product_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  Future<void> searchProduct(String title) async {
    var dio = Dio();
    emit(SearchLoading());
    print("load search");
    try {
      var res = await dio.get(
        "https://supermarket-dan1.onrender.com/api/v1/home/products?skip=0&limit=14&title=$title",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ZTBkMmRiYzM2MzQ2MDBjNzQ0OGZjNyIsImlhdCI6MTc3NjM0Mzc0NiwiZXhwIjoxNzc4OTM1NzQ2fQ.BMBcQ3W8adS9Q3jY9LCd0Dsj6FI8pfR3MIT8HO3z0lc",
          },
        ),
      );
      var data = ProductResponse.fromJson(res.data);
      emit(SearchSuccess(search: data));
      print("success search");
    } catch (e) {
      emit(SearchFailure(message: e.toString()));
      print("fail search");
    }
  }
}
