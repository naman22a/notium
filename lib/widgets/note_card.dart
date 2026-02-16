import 'package:flutter/material.dart';
import 'package:notium/models/note_model.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text('${note.content.substring(0, 100)}...'),
          ],
        ),
      ),
    );
  }
}
