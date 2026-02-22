import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:notium/common/colors.dart';
import 'package:notium/providers/trash_notes_provider.dart';
import 'package:notium/widgets/my_appbar.dart';
import 'package:notium/widgets/my_drawer.dart';
import 'package:notium/widgets/trash_note_card.dart';
import 'package:provider/provider.dart';

class TrashScreen extends StatelessWidget {
  const TrashScreen({super.key});

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
          itemCount: Provider.of<TrashNotesProvider>(context).notes.length,
          itemBuilder: (context, index) {
            final note = Provider.of<TrashNotesProvider>(context).notes[index];
            return TrashNoteCard(note: note);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
