// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'create_password_state.dart';

class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit() : super(CreatePasswordInitial());
  Future<void> createNewPassword(
    String email,
    String pass,
    String newPass,
  ) async {
    var dio = Dio();
    emit(CreatePasswordLoading());
    print("load new pass");
    try {
      var response = await dio.post(
        "https://supermarket-dan1.onrender.com/api/v1/auth/resetPassword",
        data: {"email": email, "password": pass, "confirmPassword": newPass},
      );
      emit(CreatePasswordSuccess());
      print("Success new pass");
    } on DioException catch (e) {
      print("fail new pass");
      emit(CreatePasswordFailure(errorMessage: e.toString()));
    }
  }
}
