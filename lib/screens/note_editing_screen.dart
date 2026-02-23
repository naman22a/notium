import 'package:flutter/material.dart';
import 'package:notium/providers/picked_color_provider.dart';
import 'package:provider/provider.dart';
import 'package:notium/common/colors.dart';
import 'package:notium/models/note_model.dart';
import 'package:notium/widgets/color_picker.dart';

class NoteEditingScreen extends StatefulWidget {
  final NoteModel note;

  const NoteEditingScreen({
    super.key,
    required this.note,
  });

  @override
  State<NoteEditingScreen> createState() => _NoteEditingScreenState();
}

class _NoteEditingScreenState extends State<NoteEditingScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              SizedBox(height: 10.0),
              ColorPicker(),
              SizedBox(height: 10.0),
              Text(
                'Content',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              TextField(
                controller: _contentController,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              SizedBox(height: 10.0),
              Consumer<PickedColorProvider>(
                builder: (context, provider, _) {
                  return OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(primaryColor),
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {
                      widget.note.title = _titleController.text;
                      widget.note.content = _contentController.text;
                      widget.note.color = provider.pickedColor;
                      widget.note.save();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
