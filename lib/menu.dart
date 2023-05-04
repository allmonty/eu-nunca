import 'dart:convert';
import 'dart:html';
import 'dart:math';

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
    String menuLightText = AppLocalizations.of(context)!.menuCategoryLight;
    String menuMediumText = AppLocalizations.of(context)!.menuCategoryMedium;
    String menuHeavyText = AppLocalizations.of(context)!.menuCategoryHeavy;

    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          return Scaffold(
            body: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
              ],
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
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
