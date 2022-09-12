import 'package:mangadex_mobile/api/models/api_general_response.dart';
import 'package:mangadex_mobile/api/models/api_list_manga_response.dart';
import 'package:mangadex_mobile/api/models/api_login_response.dart';

abstract class MangadexApi {
  // Auth
  Future<ApiLoginResponse> login(
      String? email, String? username, String password);

  // Manga
  Future<ApiListMangaResponse> getMangaList();
  Future<ApiGeneralResponse> getCover(String coverId);
}
