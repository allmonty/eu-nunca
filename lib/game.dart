import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.questions});

  final List<dynamic> questions;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.questions);
    print(widget.questions.length);

    void nextQuestion() {
      if (currentQuestion < widget.questions.length - 1) {
        setState(() {
          currentQuestion++;
        });
      }
    }

    void previousQuestion() {
      if (currentQuestion > 0) {
        setState(() {
          currentQuestion--;
        });
      }
    }

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(widget.questions[currentQuestion]),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Menu"),
                ),
                ElevatedButton(
                  onPressed: previousQuestion,
                  child: const Text("Anterior"),
                ),
                ElevatedButton(
                  onPressed: nextQuestion,
                  child: const Text("Próxima"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
