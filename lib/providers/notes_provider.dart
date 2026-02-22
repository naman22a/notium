import 'package:flutter/material.dart';
import 'package:notium/models/note_model.dart';

class NotesProvider with ChangeNotifier {
  List<NoteModel> _notes = [
    NoteModel(
      title: 'First Note',
      content:
          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel velit at erat sagittis tincidunt et ut odio. Mauris eu justo arcu. Morbi suscipit sem velit, vel pulvinar lacus consequat et. Nulla ultricies metus at faucibus maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula erat ac efficitur mollis. Morbi consectetur mollis aliquet. Proin vitae augue lorem.',
      color: Colors.deepOrange,
    ),
    NoteModel(
      title: 'Second Note',
      content:
          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel velit at erat sagittis tincidunt et ut odio. Mauris eu justo arcu. Morbi suscipit sem velit, vel pulvinar lacus consequat et. Nulla ultricies metus at faucibus maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula erat ac efficitur mollis. Morbi consectetur mollis aliquet. Proin vitae augue lorem.',
      color: Colors.deepPurple,
    ),
  ];

  List<NoteModel> get notes => _notes;

  set notes(List<NoteModel> notes) {
    _notes = notes;
    notifyListeners();
  }

  void addNote(String title, String content, {Color? color}) {
    _notes.add(NoteModel(
      title: title,
      content: content,
      color: color ?? Colors.white,
    ));
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }
}
