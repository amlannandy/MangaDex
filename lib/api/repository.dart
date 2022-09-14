import 'package:mangadex_mobile/api/enums/result_type.dart';
import 'package:mangadex_mobile/api/mangadex_api.dart';
import 'package:mangadex_mobile/api/mangadex_api_impl.dart';
import 'package:mangadex_mobile/api/models/api_login_response.dart';
import 'package:mangadex_mobile/models/manga.dart';

class Repository {
  late MangadexApi _api;

  Repository() {
    _api = MangadexApiImpl();
  }

  // Auth
  Future<ApiLoginResponse> login(
      String? email, String? username, String password) async {
    final response = await _api.login(email, username, password);
    if (response.result == EResultType.error) {
      return Future.error(response.errors![0].detail);
    }
    return response;
  }

  Future<List<Manga>> getMangaList() async {
    final response = await _api.getMangaList();
    if (response.result == EResultType.error) {
      return Future.error(response.errors![0].title);
    }
    List<Manga> manga = response.data;
    for (int i = 0; i < manga.length; i++) {
      final coverId = manga[i]
          .relationships
          .firstWhere((rel) => rel.type == "cover_art")
          .id;
      String? coverFileName = await getCoverFileName(coverId);
      if (coverFileName == null) {
        continue;
      }
      manga[i].setCover(coverFileName);
    }
    return manga;
  }

  Future<String?> getCoverFileName(String coverId) async {
    try {
      final response = await _api.getCover(coverId);
      if (response.result == EResultType.error) {
        return null;
      }
      return response.data['attributes']['fileName'];
    } catch (e) {
      return null;
    }
  }
}
