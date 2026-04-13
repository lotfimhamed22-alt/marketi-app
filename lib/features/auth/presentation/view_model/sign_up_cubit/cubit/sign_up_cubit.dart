// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:marketi/core/network/errors/exceptions.dart';
import 'package:marketi/features/auth/data/models/sign_up_model.dart';
import 'package:meta/meta.dart';

import 'package:marketi/core/network/api/api_consumer.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final ApiConsumer api;
  SignUpCubit(this.api) : super(SignUpInitial());

  Future<void> signUp(
    String name,
    String phone,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      emit(SignUpLoading());
      final response = await api.post(
        "https://supermarket-dan1.onrender.com/api/v1/auth/signUp",
        // isFormData: true,
        data: {
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );
      final signUpModel = SignUpModel.fromJson(response);
      emit(SignUpSuccess(message: signUpModel.message));
    } on ServerException catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
