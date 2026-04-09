import 'package:bloc/bloc.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/api/end_points.dart';
import 'package:marketi/core/errors/exceptions.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final ApiConsumer api;
  SignInCubit(this.api) : super(SignInInitial());
  signIn(String email, String password) async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoints.login,
        data: {"email": email, "password": password},
      );
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(message: e.toString()));
    }
  }
}
