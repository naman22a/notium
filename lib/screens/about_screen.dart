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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        title: 'About Us',
      ),
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
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Notium is a minimal and efficient notes organizer application designed to help users capture, manage, and organize their thoughts effortlessly.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Built with simplicity at its core, Notium focuses on delivering a clean user experience without unnecessary distractions. Whether it\'s quick ideas, class notes, or daily reminders, Notium ensures your notes are always accessible and secure.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'To provide a lightweight, fast, and distraction-free note-taking experience that enhances productivity and organization.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Key Features',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 150.0,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle_outline, size: 18),
                          SizedBox(width: 10.0),
                          Text(
                            features[index],
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Developed By',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            Text(
              'Naman Arora',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            Text(
              'Mobile Application Development Project',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            Text(
              'Android Application',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            )
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
