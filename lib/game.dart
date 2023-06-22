import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:eu_nunca/button.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
                flex: 7,
                child: GestureDetector(
                  onTapDown: (details) {
                    print(details.localPosition);
                  },
                  child: AppinioSwiper(
                    controller: controller,
                    cardsCount: widget.questions.length,
                    allowUnswipe: true,
                    unlimitedUnswipe: true,
                    cardsBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.center,
                        child: Card(
                          mainText: widget.questions[index],
                          cardColor: colors[index % colors.length],
                          primaryTextColor: Colors.black,
                          secondaryTextColor: Colors.black54,
                          upperText:
                              AppLocalizations.of(context)!.gameCardUpperText,
                          bottonText: "${index + 1}/${widget.questions.length}",
                          previous: index > 0 ? controller.unswipe : null,
                        ),
                      );
                    },
                  ),
                )),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Button(
                        onPressed: () => Navigator.pop(context),
                        child: const Icon(Icons.home),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.mainText,
    this.upperText = "",
    this.bottonText = "",
    this.primaryTextColor = const Color.fromARGB(255, 0, 0, 0),
    this.secondaryTextColor = const Color.fromARGB(255, 0, 255, 0),
    this.cardColor = const Color.fromARGB(255, 255, 255, 255),
    this.previous,
  });

  final String mainText;
  final String upperText;
  final String bottonText;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color cardColor;
  final VoidCallback? previous;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.666,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: AutoSizeText(
                  upperText,
                  minFontSize: 10,
                  maxFontSize: 30,
                  wrapWords: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  mainText,
                  minFontSize: 10,
                  maxFontSize: 120,
                  wrapWords: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 120,
                    color: primaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: previous != null ? true : false,
                    child: IconButton(
                      iconSize: 40,
                      onPressed: previous,
                      icon: Icon(
                        Icons.refresh,
                        color: secondaryTextColor,
                      ),
                    ),
                  ),
                  AutoSizeText(
                    bottonText,
                    minFontSize: 10,
                    maxFontSize: 30,
                    wrapWords: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: secondaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
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
