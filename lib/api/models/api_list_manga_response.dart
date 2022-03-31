import 'package:mangadex_mobile/api/models/api_base_success_response.dart';
import 'package:mangadex_mobile/models/manga.dart';

class ApiListMangaResponse extends ApiBaseSuccessResponse {
  late List<Manga> data;
  late int limit;
  late int offest;
  late int total;

  ApiListMangaResponse(Map<String, dynamic> json) : super(json) {
    final mangaData = json['data'];
    data = List<Manga>.from(
      mangaData.map((manga) => Manga.fromJSON(manga)).toList(),
    );
    limit = json['limit'];
    offest = json['offset'];
    total = json['total'];
  }
}
