import 'package:mangadex_mobile/api/models/api_general_response.dart';
import 'package:mangadex_mobile/api/models/api_list_manga_response.dart';

abstract class MangadexApi {
  // Manga
  Future<ApiListMangaResponse> getMangaList();
  Future<ApiGeneralResponse> getCover(String coverId);
}
