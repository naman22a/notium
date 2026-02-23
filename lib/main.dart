import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notium/models/note_model.dart';
import 'package:notium/providers/picked_color_provider.dart';
import 'package:notium/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:notium/theme/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(TrashNoteModelAdapter());
  Hive.registerAdapter(ColorAdapter());
  await Hive.openBox<NoteModel>('notes');
  await Hive.openBox<TrashNoteModel>('trash');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PickedColorProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomeScreen(),
    );
  }
}
