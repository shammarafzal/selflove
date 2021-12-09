// To parse this JSON data, do
//
//     final fitness = fitnessFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Fitness> fitnessFromJson(String str) => List<Fitness>.from(json.decode(str).map((x) => Fitness.fromJson(x)));

String fitnessToJson(List<Fitness> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fitness {
  Fitness({
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
  String categoryId;
  String name;
  String description;
  String duration;
  String type;
  String media;
  String thumbnail;
  DateTime createdAt;
  DateTime updatedAt;

  factory Fitness.fromJson(Map<String, dynamic> json) => Fitness(
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
