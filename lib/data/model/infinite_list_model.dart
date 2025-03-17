// To parse this JSON data, do
//
//     final infiniteListModel = infiniteListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<InfiniteListModel> infiniteListModelFromJson(String str) => List<InfiniteListModel>.from(json.decode(str).map((x) => InfiniteListModel.fromJson(x)));

String infiniteListModelToJson(List<InfiniteListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfiniteListModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  InfiniteListModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory InfiniteListModel.fromJson(Map<String, dynamic> json) => InfiniteListModel(
    userId: json["userId"] ?? 0,
    id: json["id"]  ?? 0,
    title: json["title"] ?? "",
    body: json["body"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
