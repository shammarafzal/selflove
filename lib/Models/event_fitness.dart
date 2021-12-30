// To parse this JSON data, do
//
//     final eventFitness = eventFitnessFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<EventFitness> eventFitnessFromJson(String str) => List<EventFitness>.from(json.decode(str).map((x) => EventFitness.fromJson(x)));

String eventFitnessToJson(List<EventFitness> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventFitness {
  EventFitness({
    required this.id,
    required this.topicId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.days,
    required this.topic,
  });

  int id;
  int topicId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  List<Day> days;
  Topic topic;

  factory EventFitness.fromJson(Map<String, dynamic> json) => EventFitness(
    id: json["id"],
    topicId: json["topic_id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
    topic: Topic.fromJson(json["topic"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "topic_id": topicId,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "days": List<dynamic>.from(days.map((x) => x.toJson())),
    "topic": topic.toJson(),
  };
}

class Day {
  Day({
    required this.id,
    required this.topicId,
    required this.monthId,
    required this.day,
    required this.detail,
    required this.createdAt,
    required this.updatedAt,
    required this.challenges,
    required this.dayId,
    required this.name,
  });

  int id;
  int topicId;
  int monthId;
  String day;
  String detail;
  DateTime createdAt;
  DateTime updatedAt;
  List<Day> challenges;
  int dayId;
  String name;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    id: json["id"],
    topicId: json["topic_id"],
    monthId: json["month_id"],
    day: json["day"] == null ? "" : json["day"],
    detail: json["detail"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    challenges: json["challenges"] == null ? [] : List<Day>.from(json["challenges"].map((x) => Day.fromJson(x))),
    dayId: json["day_id"] == null ? 1 : json["day_id"],
    name: json["name"] == null ? "" : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "topic_id": topicId,
    "month_id": monthId,
    "day": day == null ? null : day,
    "detail": detail,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "challenges": challenges == null ? null : List<dynamic>.from(challenges.map((x) => x.toJson())),
    "day_id": dayId == null ? null : dayId,
    "name": name == null ? null : name,
  };
}

class Topic {
  Topic({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
