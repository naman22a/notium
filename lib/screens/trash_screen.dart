import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:notium/common/colors.dart';
import 'package:notium/models/note_model.dart';
import 'package:notium/widgets/my_appbar.dart';
import 'package:notium/widgets/my_drawer.dart';
import 'package:notium/widgets/note_card.dart';

class TrashScreen extends StatelessWidget {
  TrashScreen({super.key});

  final List<NoteModel> _notes = [
    NoteModel(
      title: 'Third Note',
      content:
          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel velit at erat sagittis tincidunt et ut odio. Mauris eu justo arcu. Morbi suscipit sem velit, vel pulvinar lacus consequat et. Nulla ultricies metus at faucibus maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula erat ac efficitur mollis. Morbi consectetur mollis aliquet. Proin vitae augue lorem.',
    ),
    NoteModel(
      title: 'Fourth Note',
      content:
          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel velit at erat sagittis tincidunt et ut odio. Mauris eu justo arcu. Morbi suscipit sem velit, vel pulvinar lacus consequat et. Nulla ultricies metus at faucibus maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula erat ac efficitur mollis. Morbi consectetur mollis aliquet. Proin vitae augue lorem.',
    ),
  ];

  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        title: 'Trash',
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: primaryColor,
        height: 50.0,
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        child: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            final note = _notes[index];
            return Dismissible(
              key: ValueKey(note.title),
              background: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                color: Colors.green,
                child: Icon(Icons.restore, color: Colors.white),
              ),
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                color: Colors.red,
                child: Icon(Icons.delete_forever, color: Colors.white),
              ),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.startToEnd) {
                  // swipe right → restore
                  print('restoring note');
                  return true;
                } else {
                  // swipe left → delete permanently
                  return await showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Delete Permanently?"),
                      content: Text("This cannot be undone."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text(
                            "Delete",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: NoteCard(note: note),
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
