import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:notium/models/note_model.dart';
import 'package:path_provider/path_provider.dart';

Future<String> exportAllNotes() async {
  final notesBox = Hive.box<NoteModel>('notes');
  final trashBox = Hive.box<TrashNoteModel>('trash');

  final data = {
    "version": 1,
    "exportedAt": DateTime.now().toIso8601String(),
    "notes": notesBox.values.map((e) => e.toJson()).toList(),
    "trash": trashBox.values.map((e) => e.toJson()).toList(),
  };

  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/notes_backup.json');

  await file.writeAsString(jsonEncode(data));

  print("✅ Exported to: ${file.path}");

  return file.path;
}
