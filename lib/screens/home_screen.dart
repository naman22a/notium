import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notium/screens/note_editing_screen.dart';
import 'package:notium/widgets/my_appbar.dart';
import 'package:notium/widgets/my_drawer.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final random = Random();

  late final List<double> heights;

  @override
  void initState() {
    super.initState();

    heights = List.generate(
      10,
      (index) => 200 + random.nextDouble() * 300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: MyAppBar(),
      body: MasonryGridView.builder(
        itemCount: 10,
        gridDelegate:
            SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => NoteEditingScreen()));
                },
                child: Container(
                  height: heights[index],
                  color: Color(0xFF018790),
                ),
              ),
            ),
          );
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF00B7B5),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
