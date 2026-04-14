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
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ZGNhMmE2YWZmZDZiNjE3Y2EwNzA5NSIsImlhdCI6MTc3NjA2NzI5MiwiZXhwIjoxNzc4NjU5MjkyfQ.Ug7fnPqyAj5g1PpJqHIlKyJfhMIvlJLWs8_s5Ny5Q4M",
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
