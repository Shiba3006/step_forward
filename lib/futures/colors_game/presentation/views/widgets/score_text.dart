
import 'package:flutter/material.dart';

class ScoreText extends StatelessWidget {
  const ScoreText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}
