import 'package:mangadex_mobile/api/enums/result_type.dart';
import 'package:mangadex_mobile/api/mangadex_api.dart';
import 'package:mangadex_mobile/api/mangadex_api_impl.dart';
import 'package:mangadex_mobile/models/manga.dart';

class Repository {
  late MangadexApi _api;

  Repository() {
    _api = MangadexApiImpl();
  }

  Future<List<Manga>> getMangaList() async {
    final response = await _api.getMangaList();
    if (response.result == EResultType.error) {
      return Future.error(response.errors![0].title);
    }
    return response.data;
  }
}
