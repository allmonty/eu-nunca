import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

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
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 90, 62, 121),
              Color.fromARGB(255, 10, 3, 41),
            ],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 200.0,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.white,
                          child: Text(widget.questions[index]),
                        );
                      },
                      itemCount: widget.questions.length,
                      itemWidth: 300.0,
                      itemHeight: 300.0,
                      layout: SwiperLayout.TINDER,
                    ),
                  ),
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
      ),
    );
  }
}
