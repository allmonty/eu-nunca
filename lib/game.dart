import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.questions});

  final List<dynamic> questions;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int currentQuestion = 0;

  AppinioSwiperController controller = AppinioSwiperController();

  void nextQuestion() {
    if (currentQuestion < widget.questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
      controller.swipeRight();
    }
  }

  void previousQuestion() {
    if (currentQuestion > 0) {
      setState(() {
        currentQuestion--;
      });
      controller.unswipe();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      child: AppinioSwiper(
                        controller: controller,
                        cardsCount: widget.questions.length,
                        cardsBuilder: (context, index) {
                          return Container(
                            color: Colors.grey,
                            child: Center(
                              child: Text(widget.questions[index]),
                            ),
                          );
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
