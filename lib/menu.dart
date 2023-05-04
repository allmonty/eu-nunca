import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:eu_nunca/game.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void openGamePage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Game()),
    );
  }

  @override
  Widget build(BuildContext context) {
    String menuLightText = AppLocalizations.of(context)!.menuCategoryLight;
    String menuMiddleText = AppLocalizations.of(context)!.menuCategoryMiddle;
    String menuHeavyText = AppLocalizations.of(context)!.menuCategoryHeavy;

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                MenuButton(
                  text: menuLightText,
                  onPressed: () => openGamePage(context),
                ),
                const SizedBox(
                  height: 10,
                ),
                MenuButton(
                  text: menuMiddleText,
                  onPressed: () => openGamePage(context),
                ),
                const SizedBox(
                  height: 10,
                ),
                MenuButton(
                  text: menuHeavyText,
                  onPressed: () => openGamePage(context),
                )
              ],
            ),
          ),
        ],
      ),
    );
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
