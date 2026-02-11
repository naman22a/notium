import 'package:flutter/material.dart';
import 'package:notium/widgets/my_appbar.dart';
import 'package:notium/widgets/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: MyAppBar(),
      body: Center(
        child: Text(
          'Notium',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
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
