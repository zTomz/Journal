import 'package:flutter/material.dart';
import 'package:journal/utils/questions.dart';
import 'package:journal/utils/translator.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  String question = Questions.getRandomQuestion();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create entry"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(Localizations.localeOf(context));
        },
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: Translator.translateText(context, question),
            builder: (context, snapshot) {
              print(snapshot);

              return Text(
                snapshot.data ?? question,
              );
            },
          ),
        ],
      ),
    );
  }
}
