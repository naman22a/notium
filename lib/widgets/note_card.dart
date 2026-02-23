import 'package:flutter/material.dart';
import 'package:notium/common/boxes.dart';
import 'package:notium/models/note_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notium/screens/note_editing_screen.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  final int index;

  const NoteCard({super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx) {
              note.delete();
              final box = Boxes.getTrash();
              box.add(TrashNoteModel(
                title: note.title,
                content: note.content,
                color: note.color,
              ));
            },
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => NoteEditingScreen(note: note),
            ),
          );
        },
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
      ),
    );
  }
}
