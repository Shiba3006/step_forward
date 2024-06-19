import 'package:flutter/material.dart';
import 'package:step_forward/futures/words_game/data/models/word_find_quest_model.dart';

class ImagePuzzleArea extends StatelessWidget {
  const ImagePuzzleArea({
    super.key,
    required this.size,
    required this.currentQues,
  });

  final Size? size;
  final WordFindQuesModel currentQues;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size!.width / 0.75),
          child: Image.asset(
            currentQues.pathImage,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
