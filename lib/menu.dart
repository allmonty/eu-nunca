import 'dart:convert';

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

  void openGamePage(context, List<dynamic> questions) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Game(
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
    String menuTitle = AppLocalizations.of(context)!.menuTitle;
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
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          menuTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 64,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MenuButton(
                          text: menuLightText,
                          onPressed: () =>
                              openGamePage(context, snapshot.data["light"]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MenuButton(
                          text: menuMediumText,
                          onPressed: () =>
                              openGamePage(context, snapshot.data["medium"]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MenuButton(
                          text: menuHeavyText,
                          onPressed: () =>
                              openGamePage(context, snapshot.data["heavy"]),
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

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, this.text = "", this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
              Color.fromARGB(255, 252, 167, 165)),
          minimumSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
