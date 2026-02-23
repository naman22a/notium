import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notium/adapters/app_font_size_adapter.dart';
import 'package:notium/models/note_model.dart';
import 'package:notium/providers/font_provider.dart';
import 'package:notium/providers/picked_color_provider.dart';
import 'package:notium/screens/lock_screen.dart';
import 'package:provider/provider.dart';
import 'package:notium/theme/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(TrashNoteModelAdapter());
  Hive.registerAdapter(ColorAdapter());
  Hive.registerAdapter(AppFontSizeAdapter());
  await Hive.openBox<NoteModel>('notes');
  await Hive.openBox<TrashNoteModel>('trash');
  await Hive.openBox('settings');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PickedColorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FontProvider(),
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
    return Consumer<FontProvider>(
      builder: (context, fontProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).themeData,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaleFactor: fontProvider.scale),
              child: child!,
            );
          },
          home: LockScreen(),
        );
      },
    );
  }
}
