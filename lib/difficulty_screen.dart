import 'package:flutter/material.dart';
import 'package:practice_3/quiz_screen.dart';

class DifficultyScreen extends StatelessWidget {
  const DifficultyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выберите уровень сложности'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QuizScreen(level: 1)),
                );
              },
              child: Text('Лёгкий', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.orange),
              ),
              child: Text('Средний', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QuizScreen(level: 2)),
                );
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
              child: Text('Сложный', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QuizScreen(level: 3)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
