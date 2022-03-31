import 'package:mangadex_mobile/models/relationship.dart';

class Manga {
  String id;
  String title;
  List<String> altTitles;
  String description;
  int? year;
  String contentRating;
  String status;
  String state;
  String originalLanguage;
  String? lastVolume;
  String? lastChapter;
  String publicationDemographic;
  List<String> tags;
  Map<String, String> links;
  List<Relationship> relationships;

  Manga({
    required this.id,
    required this.title,
    required this.altTitles,
    required this.description,
    required this.year,
    required this.contentRating,
    required this.status,
    required this.state,
    required this.originalLanguage,
    required this.lastVolume,
    required this.lastChapter,
    required this.publicationDemographic,
    required this.tags,
    required this.links,
    required this.relationships,
  });

  factory Manga.fromJSON(Map<String, dynamic> json) {
    Manga manga = Manga(
      id: json['id'],
      title: json['attributes']['title']['en'],
      altTitles: List<String>.from(
        json['attributes']['altTitles']
            .map((title) => title.values.toList()[0].toString())
            .toList(),
      ),
      description: json['attributes']['description']['en'],
      year: json['attributes']['year'],
      contentRating: json['attributes']['contentRating'],
      status: json['attributes']['status'],
      state: json['attributes']['state'],
      originalLanguage: json['attributes']['originalLanguage'],
      lastVolume: json['attributes']['lastVolume'],
      lastChapter: json['attributes']['lastChapter'],
      publicationDemographic: json['attributes']['publicationDemographic'],
      tags: List<String>.from(
        json['attributes']['tags']
            .map((tag) => tag['attributes']['name']['en'].toString())
            .toList(),
      ),
      links: Map<String, String>.from(json['attributes']['links']),
      relationships: List<Relationship>.from(
        json['relationships']
            .map(
              (relationship) => Relationship(
                relationship['id'],
                relationship['type'],
              ),
            )
            .toList(),
      ),
    );
    return manga;
  }
}
