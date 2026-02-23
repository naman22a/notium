import 'package:hive_flutter/hive_flutter.dart';
import 'package:notium/models/note_model.dart';

class Boxes {
  static Box<NoteModel> getNotes() => Hive.box<NoteModel>('notes');
}
