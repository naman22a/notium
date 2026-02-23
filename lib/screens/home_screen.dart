import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notium/common/boxes.dart';
import 'package:notium/common/colors.dart';
import 'package:notium/models/note_model.dart';
import 'package:notium/screens/create_note_screen.dart';
import 'package:notium/widgets/my_appbar.dart';
import 'package:notium/widgets/my_drawer.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:notium/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    Hive.box('notes').close();
    super.dispose();
  }

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
        child: ValueListenableBuilder<Box<NoteModel>>(
          valueListenable: Boxes.getNotes().listenable(),
          builder: (context, box, _) {
            final notes = box.values.toList();
            return notes.isNotEmpty
                ? ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return NoteCard(note: note, index: index);
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/empty.png'),
                        Text(
                          'No data',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
              builder: (ctx) => CreateNoteScreen(),
            ),
          );
        },
        backgroundColor: primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
