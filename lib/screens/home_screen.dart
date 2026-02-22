import 'package:flutter/material.dart';
import 'package:notium/common/colors.dart';
import 'package:notium/providers/notes_provider.dart';
import 'package:notium/widgets/my_appbar.dart';
import 'package:notium/widgets/my_drawer.dart';
import 'package:notium/screens/note_editing_screen.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:notium/widgets/note_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          itemCount: Provider.of<NotesProvider>(context).notes.length,
          itemBuilder: (context, index) {
            final note = Provider.of<NotesProvider>(context).notes[index];
            return NoteCard(note: note);
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
