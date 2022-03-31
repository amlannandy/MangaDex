import 'package:mangadex_mobile/api/models/api_list_manga_response.dart';

abstract class MangadexApi {
  Future<ApiListMangaResponse> getMangaList();
}
