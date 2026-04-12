// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/errors/exceptions.dart';
import 'package:marketi/features/auth/data/models/sign_in_model.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final ApiConsumer api;
  SignInModel? user;
  SignInCubit(this.api) : super(SignInInitial());
  Future<void> signIn(String email, String password) async {
    try {
      emit(SignInLoading());

      final response = await api.post(
        "https://supermarket-dan1.onrender.com/api/v1/auth/signIn",
        data: {"email": email, "password": password},
      );
      user = SignInModel.fromJson(response);
      final tokenDecode = JwtDecoder.decode(user!.token);
      emit(SignInSuccess(user: user!));
      print(response);
      print("tokenid:${tokenDecode['id']}");
    } on ServerException catch (e) {
      emit(
        SignInFailure(
          message: e.toString(), // غيريها لو عندك errorModel
        ),
      );
    }
  }
}
