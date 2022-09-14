import 'package:dio/dio.dart';

import 'package:mangadex_mobile/api/endpoints.dart';
import 'package:mangadex_mobile/api/mangadex_api.dart';
import 'package:mangadex_mobile/api/models/api_general_response.dart';
import 'package:mangadex_mobile/api/models/api_list_manga_response.dart';
import 'package:mangadex_mobile/api/models/api_login_response.dart';
import 'package:mangadex_mobile/config.dart';

class MangadexApiImpl implements MangadexApi {
  late Dio _dio;

  MangadexApiImpl() {
    _dio = Dio();
    _dio.options = BaseOptions(baseUrl: BASE_API_URL);
  }

  @override
  Future<ApiLoginResponse> login(
      String? email, String? username, String password) async {
    final request = {'password': password};
    if (email != null) {
      request['email'] = email;
    } else if (username != null) {
      request['username'] = username;
    }
    Map<String, dynamic> data;
    try {
      final response = await _dio.post(ApiEndpoints.LOGIN, data: request);
      data = response.data;
    } on DioError catch (e) {
      data = e.response?.data;
    }
    ApiLoginResponse loginResponse = ApiLoginResponse(data);
    return loginResponse;
  }

  @override
  Future<ApiListMangaResponse> getMangaList() async {
    final response = await _dio.get(ApiEndpoints.LIST_MANGA);
    final data = response.data;
    ApiListMangaResponse listMangaResponse = ApiListMangaResponse(data);
    return listMangaResponse;
  }

  @override
  Future<ApiGeneralResponse> getCover(String coverId) async {
    final response = await _dio.get("${ApiEndpoints.GET_COVER}/$coverId");
    final data = response.data;
    ApiGeneralResponse apiGeneralResponse = ApiGeneralResponse(data);
    return apiGeneralResponse;
  }
}
