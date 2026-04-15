// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi/features/profile/data/models/profile_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    print('load profile');
    try {
      var dio = Dio();
      var response = await dio.get(
        "https://supermarket-dan1.onrender.com/api/v1/portfoilo/userData",
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ZGNhMmE2YWZmZDZiNjE3Y2EwNzA5NSIsImlhdCI6MTc3NjA2NzI5MiwiZXhwIjoxNzc4NjU5MjkyfQ.Ug7fnPqyAj5g1PpJqHIlKyJfhMIvlJLWs8_s5Ny5Q4M",
          },
        ),
      );
      print("sucess profile");
      var profile = UserResponseModel.fromJson(response.data);
      emit(ProfileSuccess(profile: profile));
      print(profile.user.name);
    } on DioException catch (e) {
      emit(ProfileFailure(errorMessage: e.toString()));
      print("fail profile");
    }
  }
}
