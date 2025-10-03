import 'package:flutter/material.dart';
import 'package:practice_3/statistics_screen.dart';

import 'difficulty_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Викторина'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Начать викторину'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DifficultyScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Посмотреть статистику'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => StatsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}