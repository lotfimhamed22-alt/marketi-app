// ignore_for_file: depend_on_referenced_packages, avoid_print, unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'password_code_state.dart';

class PasswordCodeCubit extends Cubit<PasswordCodeState> {
  PasswordCodeCubit() : super(PasswordCodeInitial());
  Future<void> resetPasswordCode(String code, String email) async {
    var dio = Dio();
    emit(PasswordCodeLoding());
    print('load code');
    try {
      var response = await dio.post(
        "https://supermarket-dan1.onrender.com/api/v1/auth/activeResetPass",
        data: {"code": code, "email": email},
      );
      print('success code');

      emit(PasswordCodeSuccess());
    } on DioException catch (e) {
      print('fail code');

      emit(PasswordCodeFailure(errorMessage: e.toString()));
    }
  }
}
