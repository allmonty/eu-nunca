import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.questions});

  final List<dynamic> questions;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int currentQuestion = 0;

  List colors = const [
    Color.fromARGB(255, 252, 167, 165),
    Color.fromRGBO(252, 243, 165, 1),
    Color.fromARGB(255, 185, 252, 165),
    Color.fromARGB(255, 165, 246, 252),
    Color.fromARGB(255, 252, 165, 248),
    Color.fromARGB(255, 252, 165, 165),
    Color.fromARGB(255, 165, 178, 252),
  ];

  AppinioSwiperController controller = AppinioSwiperController();

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
                      width: 300,
                      height: 500,
                      child: AppinioSwiper(
                        controller: controller,
                        cardsCount: widget.questions.length,
                        allowUnswipe: true,
                        unlimitedUnswipe: true,
                        cardsBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: colors[index % colors.length],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                widget.questions[index],
                                minFontSize: 24,
                                maxFontSize: 96,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Menu"),
                      ),
                      ElevatedButton(
                        onPressed: controller.unswipe,
                        child: const Text("Anterior"),
                      ),
                      ElevatedButton(
                        onPressed: controller.swipeRight,
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
