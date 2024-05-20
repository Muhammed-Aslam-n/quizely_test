
import 'package:flutter/material.dart';
class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color bgColor;
  const CalculatorButton({super.key, required this.text, required this.onPressed, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: bgColor,side: BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
