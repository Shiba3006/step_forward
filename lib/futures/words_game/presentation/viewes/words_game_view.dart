import 'package:step_forward/futures/words_game/data/lists/question_list.dart';
import 'package:step_forward/futures/words_game/presentation/viewes/widgets/word_find.dart';
import 'package:flutter/material.dart';
import 'package:step_forward/futures/words_game/data/models/word_find_quest_model.dart';
import 'package:step_forward/futures/words_game/presentation/viewes/widgets/words_game_view_body.dart';

class WordFindGameView extends StatefulWidget {
  const WordFindGameView({
    Key? key,
    required this.isInglish,
  }) : super(key: key);
  final bool isInglish;

  @override
  State<WordFindGameView> createState() => _WordFindGameViewState();
}

class _WordFindGameViewState extends State<WordFindGameView> {
  final GlobalKey<WordFindWidgetState> globalKey =
      GlobalKey<WordFindWidgetState>();
  List<WordFindQuesModel>? listQuestions;

  @override
  void initState() {
    super.initState();
    if (widget.isInglish) {
      listQuestions = AppLists.listQuestionsEn;
    } else {
      listQuestions = AppLists.listQuestionsAr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WordsGameViewBody(
        listQuestions: listQuestions,
        globalKey: globalKey,
        isInglish: widget.isInglish,
      ),
    );
  }
}
