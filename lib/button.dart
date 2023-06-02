import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.text = "",
    this.borderRadius = 20,
    this.color = const Color.fromARGB(255, 252, 167, 165),
    this.onPressed,
  });

  final String text;
  final double borderRadius;
  final Color color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          minimumSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
