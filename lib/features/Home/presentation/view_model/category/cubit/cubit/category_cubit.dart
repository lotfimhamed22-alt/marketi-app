// ignore_for_file: depend_on_referenced_packages, avoid_print
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi/features/Home/data/models/category_model.dart';
import 'package:meta/meta.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  Future<void> getCategories() async {
    emit(CategoryLoading());
    print("loading");
    try {
      var dio = Dio();
      var response = await dio.get(
        "https://supermarket-dan1.onrender.com/api/v1/home/categories",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ZTBkMmRiYzM2MzQ2MDBjNzQ0OGZjNyIsImlhdCI6MTc3NjM0Mzc0NiwiZXhwIjoxNzc4OTM1NzQ2fQ.BMBcQ3W8adS9Q3jY9LCd0Dsj6FI8pfR3MIT8HO3z0lc",
          },
        ),
      );
      print("success");
      var category = CategoryResponse.fromJson(response.data);
      emit(CategorySuccess(categoryResponse: category));
    } on DioException catch (e) {
      print("failure");
      emit(CategoryFailure(errorMessage: e.toString()));
    }
  }
}
