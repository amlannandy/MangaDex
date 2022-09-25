import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final sessionToken = sharedPreferences.get("session-token");
    if (sessionToken != null) {
      options.headers = {
        HttpHeaders.authorizationHeader: "Bearer $sessionToken"
      };
      handler.next(options);
    }
    super.onRequest(options, handler);
  }
}
