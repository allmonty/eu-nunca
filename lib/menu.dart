import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  text: Text(menuLightText),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                MenuButton(
                  text: Text(menuMiddleText),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                MenuButton(
                  text: Text(menuHeavyText),
                  onPressed: () {},
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
  const MenuButton({super.key, this.text, this.onPressed});

  final Text? text;
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
        child: text,
      ),
    );
  }
}
