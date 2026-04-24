// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/network/api/api_consumer.dart';
import 'package:marketi/core/network/api/end_points.dart';
import 'package:marketi/core/services/chash_helper.dart';
import 'package:marketi/core/services/service_locator.dart';
import 'package:marketi/features/profile/data/models/profile_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.api) : super(ProfileInitial());
  final ApiConsumer api;

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    print('load profile');
    try {
      final response = await api.get(
        // EndPoints.getUserDataEndPoind(
        //   getIt<ChashHelper>().getDataToken(key: 'id'),
        // ),
        "",
      );
      // final data = UserResponseModel.fromJson(json);

      //  emit(ProfileSuccess(profile: UserResponseModel.fromJson(response.data)));
      // print(profile.user.name);
    } on DioException catch (e) {
      emit(ProfileFailure(errorMessage: e.toString()));
      print("fail profile");
    }
  }
}

//    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5ZGNhMmE2YWZmZDZiNjE3Y2EwNzA5NSIsImlhdCI6MTc3NjA2NzI5MiwiZXhwIjoxNzc4NjU5MjkyfQ.Ug7fnPqyAj5g1PpJqHIlKyJfhMIvlJLWs8_s5Ny5Q4M",
