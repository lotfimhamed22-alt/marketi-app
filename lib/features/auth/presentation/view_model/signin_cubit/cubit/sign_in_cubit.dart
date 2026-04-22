// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:marketi/core/network/api/api_consumer.dart';
import 'package:marketi/core/network/errors/exceptions.dart';
import 'package:marketi/core/services/chash_helper.dart';
import 'package:marketi/core/services/service_locator.dart';
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
      getIt<ChashHelper>().saveData(key: "token", value: user!.token);
      getIt<ChashHelper>().saveData(key: "id", value: tokenDecode['id']);
      emit(SignInSuccess());
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
