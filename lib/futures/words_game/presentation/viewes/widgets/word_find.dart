// make statefull widget name WordFindWidget
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:step_forward/core/utils/alphabet_list.dart';
import 'package:step_forward/futures/words_game/data/models/word_find_char_model.dart';
import 'package:step_forward/futures/words_game/data/models/word_find_quest_model.dart';
import 'package:step_forward/futures/words_game/presentation/viewes/widgets/controll_btns.dart';
import 'package:step_forward/futures/words_game/presentation/viewes/widgets/image_puzzle_area.dart';
import 'package:step_forward/futures/words_game/presentation/viewes/widgets/words_quest_puzzle.dart';
import 'package:word_search_safety/word_search_safety.dart';

class WordFindWidget extends StatefulWidget {
  final Size size;
  final List<WordFindQuesModel> listQuestions;
  final bool isInglish;

  const WordFindWidget({
    super.key,
    required this.size,
    required this.listQuestions,
    required this.isInglish,
  });

  @override
  State<WordFindWidget> createState() => WordFindWidgetState();
}

class WordFindWidgetState extends State<WordFindWidget> {
  GlobalKey<WordFindWidgetState> globalKey = GlobalKey();
  Size? size;
  List<WordFindQuesModel>? listQuestions;
  int indexQues = 0;
  int hintCount = 0;

  @override
  void initState() {
    super.initState();
    size = widget.size;
    listQuestions = widget.listQuestions;
    generatePuzzle();
  }

  @override
  Widget build(BuildContext context) {
    WordFindQuesModel currentQues = listQuestions![indexQues];
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          ControllButtons(
            // generateHint: () => generateHint(),
            generatePuzzleBack: () => generatePuzzle(back: true),
            generatePuzzleNext: () => generatePuzzle(next: true),
          ),
          ImagePuzzleArea(size: size, currentQues: currentQues),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              currentQues.question,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          WordsQuestPuzzle(currentQues: currentQues),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 6,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: 12, // later change
            shrinkWrap: true,
            itemBuilder: (context, index) {
              bool statusBtn = currentQues.puzzles
                      .indexWhere((puzzle) => puzzle.currentIndex == index) >=
                  0;

              return LayoutBuilder(
                builder: (context, constraints) {
                  Color color =
                      statusBtn ? Colors.white70 : const Color(0xff7EE7FD);

                  return Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // margin: ,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(50, constraints.biggest.height),
                      ),
                      child: Center(
                        child: Text(
                          currentQues.arrayBtns![index].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        await setBtnClick(index);
                        // if (!statusBtn) await setBtnClick(index);
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void generatePuzzle({
    List<WordFindQuesModel>? loop,
    bool next = false,
    bool back = false,
  }) {
    // lets finish up generate puzzle
    if (loop != null) {
      indexQues = 0;
      listQuestions!.clear();
      listQuestions!.addAll(loop);
    } else {
      if (next && indexQues < listQuestions!.length - 1) {
        indexQues++;
      } else if (back && indexQues > 0) {
        indexQues--;
      } else if (back && indexQues == 0) {
        return;
      } else if (indexQues >= listQuestions!.length - 1) {
        return;
      }

      setState(() {});

      if (listQuestions![indexQues].isDone) return;
    }

    WordFindQuesModel currentQues = listQuestions![indexQues];

    setState(() {});

    final List<String> wl = [currentQues.answer];

    final WSSettings ws = getWSettigs(isEn: widget.isInglish);

    final WordSearchSafety wordSearch = WordSearchSafety();

    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    // check if got error generate random word
    if (newPuzzle.errors != null && newPuzzle.errors!.isEmpty) {
      currentQues.arrayBtns = newPuzzle.puzzle!.expand((list) => list).toList();
      currentQues.arrayBtns!.shuffle(); // make shuffle so user not know answer

      bool isDone = currentQues.isDone;

      if (!isDone) {
        currentQues.puzzles = List.generate(wl[0].split("").length, (index) {
          return WordFindCharModel(
              correctValue: currentQues.answer.split("")[index]);
        });
      }
    }

    hintCount = 0; 
    setState(() {});
  }

  WSSettings getWSettigs({required bool isEn}) {
    final WSSettings ws;
    if (isEn) {
      ws = WSSettings(
        width: 12, // total random word row we want use
        height: 1,
        orientations: List.from([
          WSOrientation.horizontal,
        ]),
      );
    } else {
      ws = WSSettings(
        fillBlanks: () {
          return kArabicAlphabet[Random().nextInt(kArabicAlphabet.length)];
        },
        width: 12, // total random word row we want use
        height: 1,
        orientations: List.from([
          WSOrientation.horizontal,
        ]),
      );
    }
    return ws;
  }

  generateHint() async {
    // let dclare hint
    
    WordFindQuesModel currentQues = listQuestions![indexQues];

    List<WordFindCharModel> puzzleNoHints = currentQues.puzzles
        .where((puzzle) => !puzzle.hintShow && puzzle.currentIndex == null)
        .toList();

    if (puzzleNoHints.isNotEmpty) {
      hintCount++;
      int indexHint = Random().nextInt(puzzleNoHints.length);
      int countTemp = 0;
      // print("hint $indexHint");

      currentQues.puzzles = currentQues.puzzles.map((puzzle) {
        if (!puzzle.hintShow && puzzle.currentIndex == null) countTemp++;

        if (indexHint == countTemp - 1) {
          puzzle.hintShow = true;
          puzzle.currentValue = puzzle.correctValue;
          puzzle.currentIndex = currentQues.arrayBtns!
              .indexWhere((btn) => btn == puzzle.correctValue);
        }

        return puzzle;
      }).toList();

      // check if complete

      if (currentQues.fieldCompleteCorrect(widget.isInglish)) {
        currentQues.isDone = true;

        setState(() {});
        
        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }

      
      setState(() {});
    }
  }

  Future<void> setBtnClick(int index) async {
    WordFindQuesModel currentQues = listQuestions![indexQues];
    int currentIndexEmpty;
    if (widget.isInglish) {
      currentIndexEmpty = currentQues.puzzles
          .indexWhere((puzzle) => puzzle.currentValue == null);
    } else {
      currentIndexEmpty = currentQues.puzzles
          .lastIndexWhere((puzzle) => puzzle.currentValue == null);
    }

    if (currentIndexEmpty >= 0) {
      currentQues.puzzles[currentIndexEmpty].currentIndex = index;
      currentQues.puzzles[currentIndexEmpty].currentValue =
          currentQues.arrayBtns![index];

      if (currentQues.fieldCompleteCorrect(widget.isInglish)) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }
      setState(() {});
    }
  }
}
