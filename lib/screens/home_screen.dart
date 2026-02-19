import 'package:flutter/material.dart';
import 'package:notium/common/colors.dart';
import 'package:notium/widgets/my_appbar.dart';
import 'package:notium/widgets/my_drawer.dart';
import 'package:notium/models/note_model.dart';
import 'package:notium/screens/note_editing_screen.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:notium/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<NoteModel> _notes = [
    NoteModel(
      title: 'First Note',
      content:
          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel velit at erat sagittis tincidunt et ut odio. Mauris eu justo arcu. Morbi suscipit sem velit, vel pulvinar lacus consequat et. Nulla ultricies metus at faucibus maximus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vehicula erat ac efficitur mollis. Morbi consectetur mollis aliquet. Proin vitae augue lorem.',
    ),
    NoteModel(
      title: 'Second Note',
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
      appBar: MyAppBar(),
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
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => NoteEditingScreen(
                      title: note.title,
                      content: note.content,
                    ),
                  ),
                );
              },
              child: NoteCard(note: note),
            );
          },
        ),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => NoteEditingScreen(
                title: '',
                content: '',
              ),
            ),
          );
        },
        backgroundColor: primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
