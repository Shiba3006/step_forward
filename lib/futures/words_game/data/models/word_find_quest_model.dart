import 'package:step_forward/futures/words_game/data/models/word_find_char_model.dart';

class WordFindQuesModel {
  final String question;
  final String pathImage;
  final String answer;
  bool isDone = false;
  bool isFull = false;
  List<WordFindCharModel> puzzles = [];
  List<String>? arrayBtns = [];

  WordFindQuesModel({
    required this.question,
    required this.pathImage,
    required this.answer,
    this.arrayBtns,
  });

  void setWordFindChar(List<WordFindCharModel> puzzles) =>
      this.puzzles = puzzles;

  void setIsDone() => isDone = true;

  bool fieldCompleteCorrect(bool isEn) {
    // lets declare class WordFindChar 1st
    // check all field already got value
    // fix color red when value not full but show red color
    bool complete =
        puzzles.where((puzzle) => puzzle.currentValue == null).isEmpty;

    if (!complete) {
      // no complete yet
      isFull = false;
      return complete;
    }

    isFull = true;
    // if already complete, check correct or not
    String answeredString;
    if (isEn) {
      answeredString = puzzles.map((puzzle) => puzzle.currentValue).join("");
    } else {
      answeredString = puzzles
        .map((puzzle) => puzzle.currentValue)
        .join("")
        .split('')
        .reversed
        .join('');
    }

    // if same string, answer is correct..yeay
    return answeredString == answer;
  }

  // more prefer name.. haha
  WordFindQuesModel clone() {
    return WordFindQuesModel(
      answer: answer,
      pathImage: pathImage,
      question: question,
    );
  }

  // lets generate sample question
}
