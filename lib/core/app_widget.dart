import 'package:flutter/material.dart';
import 'package:flutter_quizz/home/home_page.dart';
import 'package:flutter_quizz/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: HomePage(),
    );
  }
}
