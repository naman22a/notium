import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  Color color;

  NoteModel({
    required this.title,
    required this.content,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "color": color.value,
      };

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json["title"],
      content: json["content"],
      color: Color(json["color"]),
    );
  }
}

@HiveType(typeId: 1)
class TrashNoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  Color color;

  TrashNoteModel({
    required this.title,
    required this.content,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "color": color.value,
      };

  factory TrashNoteModel.fromJson(Map<String, dynamic> json) {
    return TrashNoteModel(
      title: json["title"],
      content: json["content"],
      color: Color(json["color"]),
    );
  }
}
