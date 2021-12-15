import 'package:meta/meta.dart';
import 'dart:convert';

List<FetchMeditations> fetchMeditationsFromJson(String str) =>
    List<FetchMeditations>.from(
        json.decode(str).map((x) => FetchMeditations.fromJson(x)));

String fetchMeditationsToJson(List<FetchMeditations> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchMeditations {
  FetchMeditations({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.media,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String description;
  String thumbnail;
  String media;
  DateTime createdAt;
  DateTime updatedAt;

  factory FetchMeditations.fromJson(Map<String, dynamic> json) =>
      FetchMeditations(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        media: json["media"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "thumbnail": thumbnail,
        "media": media,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
