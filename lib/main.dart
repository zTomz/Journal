import 'package:flutter/material.dart';
import 'package:journal/constant/color_scheme.dart';
import 'package:journal/pages/entry_page.dart';
import 'package:journal/utils/questions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Questions.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: darkColorScheme,
      ),
      home: const EntryPage(),
    );
  }
}
