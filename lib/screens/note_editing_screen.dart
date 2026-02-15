import 'package:flutter/material.dart';
import 'package:notium/common/colors.dart';
import 'package:notium/widgets/color_picker.dart';

class NoteEditingScreen extends StatefulWidget {
  const NoteEditingScreen({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  State<NoteEditingScreen> createState() => _NoteEditingScreenState();
}

class _NoteEditingScreenState extends State<NoteEditingScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _contentController = TextEditingController(text: widget.content);
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
              OutlinedButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(primaryColor),
                  backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
