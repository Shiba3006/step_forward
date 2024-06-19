import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget {
  final String answerNumber;
  final VoidCallback onTap;
  const AnswerButton(
      {super.key, required this.answerNumber, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                blurRadius: 8,
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              answerNumber,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
