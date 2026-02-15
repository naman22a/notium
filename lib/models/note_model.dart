import 'package:flutter/material.dart';

class NoteModel {
  String title;
  String content;
  late Color color;

  NoteModel({
    required this.title,
    required this.content,
    this.color = const Color(0xFF00B7B5),
  });
}
