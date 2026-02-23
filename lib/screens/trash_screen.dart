import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:notium/common/boxes.dart';
import 'package:notium/common/colors.dart';
import 'package:notium/models/note_model.dart';
import 'package:notium/widgets/my_appbar.dart';
import 'package:notium/widgets/my_drawer.dart';
import 'package:notium/widgets/trash_note_card.dart';

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
        child: ValueListenableBuilder<Box<TrashNoteModel>>(
          valueListenable: Boxes.getTrash().listenable(),
          builder: (context, box, _) {
            final notes = box.values.toList();
            return notes.isNotEmpty
                ? ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return TrashNoteCard(note: note, index: index);
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/void.png',
                          height: 350,
                          width: 350,
                        ),
                        Text(
                          'Trash is Empty',
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
    );
  }
}
