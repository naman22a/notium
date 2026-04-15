import 'dart:convert';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notium/models/note_model.dart';
import 'package:path_provider/path_provider.dart';

Future<void> importAllNotes() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/notes_backup.json');

  if (!await file.exists()) {
    print("❌ Backup file not found");
    return;
  }

  final content = await file.readAsString();
  final data = jsonDecode(content);

  final notesBox = Hive.box<NoteModel>('notes');
  final trashBox = Hive.box<TrashNoteModel>('trash');

  await notesBox.clear();
  await trashBox.clear();

  for (var json in data["notes"]) {
    notesBox.add(NoteModel.fromJson(json));
  }

  for (var json in data["trash"]) {
    trashBox.add(TrashNoteModel.fromJson(json));
  }

  print("✅ Import successful");
}
