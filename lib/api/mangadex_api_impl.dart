import 'package:dio/dio.dart';
import 'package:mangadex_mobile/api/endpoints.dart';
import 'package:mangadex_mobile/api/mangadex_api.dart';
import 'package:mangadex_mobile/api/models/api_general_response.dart';
import 'package:mangadex_mobile/api/models/api_list_manga_response.dart';
import 'package:mangadex_mobile/config.dart';

class MangadexApiImpl implements MangadexApi {
  late Dio _dio;

  MangadexApiImpl() {
    _dio = Dio();
    _dio.options = BaseOptions(baseUrl: BASE_API_URL);
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
