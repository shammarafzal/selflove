// To parse this JSON data, do
//
//     final suggestion = suggestionFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Suggestion> suggestionFromJson(String str) => List<Suggestion>.from(json.decode(str).map((x) => Suggestion.fromJson(x)));

String suggestionToJson(List<Suggestion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Suggestion {
  Suggestion({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.duration,
    required this.type,
    required this.media,
    required this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int categoryId;
  String name;
  String description;
  String duration;
  String type;
  String media;
  String thumbnail;
  DateTime createdAt;
  DateTime updatedAt;

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    description: json["description"],
    duration: json["duration"],
    type: json["type"],
    media: json["media"],
    thumbnail: json["thumbnail"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "description": description,
    "duration": duration,
    "type": type,
    "media": media,
    "thumbnail": thumbnail,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
