import 'package:flutter/material.dart';
import 'package:step_forward/futures/words_game/data/models/word_find_quest_model.dart';

class WordsQuestPuzzle extends StatefulWidget {
  const WordsQuestPuzzle({super.key, required this.currentQues});
  final WordFindQuesModel currentQues;
  @override
  State<WordsQuestPuzzle> createState() => _WordsQuestPuzzleState();
}

class _WordsQuestPuzzleState extends State<WordsQuestPuzzle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: widget.currentQues.puzzles.map((puzzle) {
              Color? color;
              if (widget.currentQues.isDone) {
                color = Colors.green[300];
              } else if (puzzle.hintShow) {
                color = Colors.yellow[100];
              } else if (widget.currentQues.isFull) {
                color = Colors.red;
              } else {
                color = const Color(0xff7EE7FD);
              }
              return InkWell(
                onTap: () {
                  if (puzzle.hintShow || widget.currentQues.isDone) return;
                  widget.currentQues.isFull = false;
                  puzzle.clearValue();
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: constraints.biggest.width / 7 - 6,
                  height: constraints.biggest.width / 7 - 6,
                  margin: const EdgeInsets.all(3),
                  child: Text(
                    puzzle.currentValue?.toUpperCase() ?? '',
                    
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
