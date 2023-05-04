import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.questions});

  final List<dynamic> questions;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    print(widget.questions);
    print(widget.questions.length);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text("Teste"),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("aperta"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
