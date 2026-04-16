// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi/features/forget_password/data/models/reset_password_model.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  Future<void> resetPassword(String email) async {
    var dio = Dio();
    emit(ResetPasswordLoading());
    print('load reset pass');
    try {
      var response = await dio.post(
        "https://supermarket-dan1.onrender.com/api/v1/auth/resetPassCode",
        data: {"email": email},
      );
      print('success reset pass');

      emit(ResetPasswordSuccess());
    } on DioException catch (e) {
      print('fail reset pass');

      emit(ResetPasswordFailure(errorMessage: e.toString()));
    }
  }
}
