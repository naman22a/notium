import 'package:flutter/material.dart';
import 'package:notium/common/colors.dart';
import 'package:notium/providers/notes_provider.dart';
import 'package:notium/providers/picked_color_provider.dart';
import 'package:notium/widgets/color_picker.dart';
import 'package:provider/provider.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

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
              Text('Title'),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              ColorPicker(),
              SizedBox(height: 10.0),
              Text('Content'),
              TextField(
                controller: _contentController,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              Consumer<PickedColorProvider>(
                builder: (context, provider, child) {
                  return OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(primaryColor),
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {
                      context.read<NotesProvider>().addNote(
                            _titleController.text,
                            _contentController.text,
                            color: provider.pickedColor,
                          );
                      Navigator.pop(context);
                    },
                    child: Text('Create'),
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
