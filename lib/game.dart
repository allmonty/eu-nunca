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
                        layout: SwiperLayout.CUSTOM,
                        customLayoutOption:
                            CustomLayoutOption(startIndex: -1, stateCount: 3)
                              ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                              ..addTranslate([
                                const Offset(-370.0, -40.0),
                                const Offset(0.0, 0.0),
                                const Offset(370.0, -40.0)
                              ]),
                        itemWidth: 300.0,
                        itemHeight: 200.0,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.grey,
                            child: Center(
                              child: Text(widget.questions[index]),
                            ),
                          );
                        },
                        itemCount: widget.questions.length,
                      )),
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
