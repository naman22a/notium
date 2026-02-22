import 'package:flutter/material.dart';
import 'package:notium/models/note_model.dart';

class TrashNotesProvider with ChangeNotifier {
  List<NoteModel> _notes = [
    NoteModel(
      title: 'Third Note',
      content:
          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel velit at erat sagittis tincidunt et ut odio. Mauris eu justo arcu. Morbi suscipit sem velit, vel pulvinar lacus consequat et. Nulla ultricies metus at faucibus maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula erat ac efficitur mollis. Morbi consectetur mollis aliquet. Proin vitae augue lorem.',
      color: Colors.cyan,
    ),
    NoteModel(
      title: 'Fourth Note',
      content:
          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel velit at erat sagittis tincidunt et ut odio. Mauris eu justo arcu. Morbi suscipit sem velit, vel pulvinar lacus consequat et. Nulla ultricies metus at faucibus maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula erat ac efficitur mollis. Morbi consectetur mollis aliquet. Proin vitae augue lorem.',
      color: Colors.lightGreen,
    ),
  ];

  List<NoteModel> get notes => _notes;

  set notes(List<NoteModel> notes) {
    _notes = notes;
    notifyListeners();
  }

  void addNoteToTrash(String title, String content, {Color? color}) {
    _notes.add(NoteModel(
      title: title,
      content: content,
      color: color ?? Colors.white,
    ));
    notifyListeners();
  }
}
