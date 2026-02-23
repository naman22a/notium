import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notium/common/boxes.dart';
import 'package:notium/models/note_model.dart';
import 'package:notium/providers/trash_notes_provider.dart';
import 'package:provider/provider.dart';

class TrashNoteCard extends StatelessWidget {
  final NoteModel note;
  final int index;

  const TrashNoteCard({super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              final box = Boxes.getNotes();
              box.add(NoteModel(
                title: note.title,
                content: note.content,
                color: note.color,
              ));
              context.read<TrashNotesProvider>().deleteNote(index);
            },
            icon: Icons.loop,
            backgroundColor: Colors.green,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              context.read<TrashNotesProvider>().deleteNote(index);
            },
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: note.color.withAlpha(90),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset(0, -5.0),
              blurRadius: 10.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        margin: EdgeInsets.all(10.0),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  '${note.content.substring(0, note.content.length > 100 ? 100 : note.content.length)}...'),
            ],
          ),
        ),
      ),
    );
  }
}
