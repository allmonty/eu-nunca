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
                      height: 200.0,
                      child: AppinioSwiper(
                        controller: controller,
                        cardsCount: widget.questions.length,
                        allowUnswipe: true,
                        unlimitedUnswipe: true,
                        cardsBuilder: (context, index) {
                          return Container(
                            color: colors[index % colors.length],
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
