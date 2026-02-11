import 'package:flutter/material.dart';
import 'package:notium/screens/home_screen.dart';
import 'package:notium/screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SettingsScreen.id,
      routes: {
        HomeScreen.id: (ctx) => HomeScreen(),
        SettingsScreen.id: (ctx) => SettingsScreen(),
      },
    );
  }
}
