import 'package:flutter/material.dart';

class InstructionAlphabet extends StatelessWidget {
  const InstructionAlphabet({
    super.key,
    required this.char,
  });
  final String char;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: Center(
          child: Text(
            char,
            style: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
