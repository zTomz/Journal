import 'dart:math';

import 'package:flutter/services.dart';

class Questions {
  static List<String> allQuestions = [];

  static Future<void> init() async {
    allQuestions = await rootBundle
        .loadString("assets/data/questions.txt")
        .then((value) => value.split("\n"));
  }

  static String getRandomQuestion() {
    return allQuestions[Random().nextInt(allQuestions.length)];
  }
}
