import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NoteEditingScreen extends StatefulWidget {
  const NoteEditingScreen({super.key});

  @override
  State<NoteEditingScreen> createState() => _NoteEditingScreenState();
}

class _NoteEditingScreenState extends State<NoteEditingScreen> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          QuillSimpleToolbar(
            controller: _controller,
            config: const QuillSimpleToolbarConfig(),
          ),
          Expanded(
            child: QuillEditor.basic(
              controller: _controller,
              config: const QuillEditorConfig(),
            ),
          )
        ],
      ),
    );
  }
}
