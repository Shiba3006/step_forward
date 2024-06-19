import 'package:flutter/material.dart';
import 'package:step_forward/core/widgets/custom_button.dart';
import 'package:step_forward/futures/words_game/data/models/word_find_quest_model.dart';
import 'package:step_forward/futures/words_game/presentation/viewes/widgets/word_find.dart';

class WordsGameViewBody extends StatefulWidget {
  const WordsGameViewBody({
    super.key,
    required this.listQuestions,
    required this.globalKey, 
    required this.isInglish,
  });

  final List<WordFindQuesModel>? listQuestions;
  final GlobalKey<WordFindWidgetState> globalKey;
  final bool isInglish;

  @override
  State<WordsGameViewBody> createState() => _WordsGameViewBodyState();
}

class _WordsGameViewBodyState extends State<WordsGameViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.blueGrey[400],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return WordFindWidget(
                      isInglish: widget.isInglish,
                      size: constraints.biggest,
                      listQuestions:
                          widget.listQuestions!.map((ques) => ques.clone()).toList(),
                      key: widget.globalKey,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonText: "RESTART",
                onPressed: () {
                  // reload btn test
                  widget.globalKey.currentState!.generatePuzzle(
                    loop: widget.listQuestions!.map((ques) => ques.clone()).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
