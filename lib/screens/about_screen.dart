import 'package:flutter/material.dart';
import 'package:notium/widgets/my_appbar.dart';
import 'package:notium/widgets/my_drawer.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final List<String> features = [
    "Create, edit, and delete notes easily",
    "Clean and minimal interface",
    "App Lock (PIN / Biometric security)",
    "Auto-lock functionality",
    "Adjustable font size",
    "Light/Dark theme support",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Notium',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Notium is a minimal and efficient notes organizer application designed to help users capture, manage, and organize their thoughts effortlessly.',
            ),
            SizedBox(height: 10.0),
            Text(
              'Built with simplicity at its core, Notium focuses on delivering a clean user experience without unnecessary distractions. Whether it\'s quick ideas, class notes, or daily reminders, Notium ensures your notes are always accessible and secure.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'To provide a lightweight, fast, and distraction-free note-taking experience that enhances productivity and organization.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Key Features',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              children: features.map((feature) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle_outline, size: 18),
                        SizedBox(width: 10.0),
                        Text(feature),
                      ],
                    ),
                    SizedBox(height: 5.0),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Text(
              'Developed By',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Naman Arora',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Mobile Application Development Project'),
            Text('Android Application')
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
