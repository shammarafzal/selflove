// To parse this JSON data, do
//
//     final me = meFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Me> meFromJson(String str) => List<Me>.from(json.decode(str).map((x) => Me.fromJson(x)));

String meToJson(List<Me> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Me {
  Me({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.age,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String isAdmin;
  dynamic age;
  dynamic image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Me.fromJson(Map<String, dynamic> json) => Me(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    isAdmin: json["is_admin"],
    age: json["age"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "is_admin": isAdmin,
    "age": age,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
