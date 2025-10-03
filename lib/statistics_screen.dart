import 'package:flutter/material.dart';
import 'package:practice_3/quiz_stats.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double avgScore = QuizStats.totalGames > 0
        ? QuizStats.totalScore / QuizStats.totalGames
        : 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Статистика'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Пройдено викторин: ${QuizStats.totalGames}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Всего правильных ответов: ${QuizStats.totalScore}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Средний результат: ${avgScore.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Вернуться на главную'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
