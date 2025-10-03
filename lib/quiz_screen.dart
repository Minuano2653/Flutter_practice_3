import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practice_3/quiz_stats.dart';
import 'package:practice_3/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final int level;

  const QuizScreen({super.key, required this.level});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;

  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    super.initState();
    questions = List.generate(3, (_) => generateQuestion(widget.level));
  }

  Map<String, dynamic> generateQuestion(int level) {
    Random rand = Random();
    int a, b, answer;
    switch (level) {
      case 1: // лёгкий
        a = rand.nextInt(100) + 1;
        b = rand.nextInt(100) + 1;
        answer = a + b;
        break;
      case 2: // средний
        a = rand.nextInt(20) + 1;
        b = rand.nextInt(20) + 1;
        answer = a * b;
        break;
      case 3: // сложный
        a = rand.nextInt(50) + 1;
        b = rand.nextInt(50) + 1;
        answer = a * b;
        break;
      default:
        a = 1;
        b = 1;
        answer = 2;
    }

    List<int> options = [answer];
    while (options.length < 4) {
      int opt = answer + rand.nextInt(10) - 5;
      if (!options.contains(opt)) options.add(opt);
    }
    options.shuffle();

    return {
      'question': '$a ${level == 1 ? "+" : "*"} $b = ?',
      'answer': answer,
      'options': options,
    };
  }

  void checkAnswer(int selected) {
    if (selected == questions[currentQuestion]['answer']) score++;
    if (currentQuestion < questions.length - 1) {
      setState(() => currentQuestion++);
    } else {
      QuizStats.totalGames++;
      QuizStats.totalScore += score;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(score: score, total: questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var q = questions[currentQuestion];
    return Scaffold(
      appBar: AppBar(
        title: Text('Вопрос ${currentQuestion + 1}'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        alignment: AlignmentGeometry.center,
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(q['question'], style: TextStyle(fontSize: 36)),
            SizedBox(height: 20),
            ...q['options'].map<Widget>(
              (opt) => ElevatedButton(
                child: Text(opt.toString()),
                onPressed: () => checkAnswer(opt),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
