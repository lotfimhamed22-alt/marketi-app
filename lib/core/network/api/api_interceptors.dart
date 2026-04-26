// ignore_for_file: unnecessary_null_comparison, dead_code

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // // options.headers['Content-Type'] = 'application/json';
    // // options.headers['Accept'] = 'application/json';
    // options.headers['token'] =
    //     getIt<ChashHelper>().getData(key: "token") != null
    //     ? 'Bearer ${getIt<ChashHelper>().getData(key: "token")}'
    //     : null;
    super.onRequest(options, handler);
  }
}
