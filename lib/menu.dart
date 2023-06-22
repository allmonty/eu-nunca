import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:eu_nunca/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:eu_nunca/game.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Future<dynamic>? data;

  @override
  void initState() {
    super.initState();
    data = loadGameData();
  }

  void openGamePage(context, String gameName, List<dynamic> questions) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Game(
          gameName: gameName,
          questions: questions,
        );
      }),
    );
  }

  Future<void> loadGameData() async {
    const String path = 'assets/data/game_data_pt.json';
    final String response = await rootBundle.loadString(path);
    return await json.decode(response);
  }

  @override
  Widget build(BuildContext context) {
    String menuTitle1 = AppLocalizations.of(context)!.menuTitle1;
    String menuTitle2 = AppLocalizations.of(context)!.menuTitle2;
    String menuLightText = AppLocalizations.of(context)!.menuCategoryLight;
    String menuMediumText = AppLocalizations.of(context)!.menuCategoryMedium;
    String menuHeavyText = AppLocalizations.of(context)!.menuCategoryHeavy;

    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Flexible(
                    flex: 2,
                    child: SizedBox(width: 10),
                  ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          menuTitle1,
                          minFontSize: 24,
                          maxFontSize: 120,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 120,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AutoSizeText(
                          menuTitle2,
                          minFontSize: 24,
                          maxFontSize: 120,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 120,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Button(
                          child: Text(menuLightText),
                          onPressed: () => openGamePage(
                            context,
                            menuLightText,
                            snapshot.data["light"],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Button(
                          child: Text(menuMediumText),
                          onPressed: () => openGamePage(
                            context,
                            menuMediumText,
                            snapshot.data["medium"],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Button(
                          child: Text(menuHeavyText),
                          onPressed: () => openGamePage(
                            context,
                            menuHeavyText,
                            snapshot.data["heavy"],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Flexible(
                    flex: 2,
                    child: SizedBox(width: 10),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
