// To parse this JSON data, do
//
//     final notesModel = notesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

part 'notes_model.g.dart';

NotesModel notesModelFromJson(String str) => NotesModel.fromJson(json.decode(str));

String notesModelToJson(NotesModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class NotesModel {
  @HiveField(1)
  late final String title;

  NotesModel({
    required this.title,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
  };
}
