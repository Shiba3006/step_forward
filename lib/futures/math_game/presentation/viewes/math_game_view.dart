import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:step_forward/core/utils/app_colors.dart';
import 'package:step_forward/core/utils/assets_data.dart';
import 'package:step_forward/core/widgets/custom_appbar.dart';
import 'package:step_forward/futures/math_game/presentation/viewes/lose_page.dart';
import 'package:step_forward/futures/math_game/presentation/viewes/widgets/answer_button.dart';

class MathGameView extends StatefulWidget {
  const MathGameView({super.key});

  @override
  State<MathGameView> createState() => _MathGameViewState();
}

class _MathGameViewState extends State<MathGameView> {
  int playerScore = 0;

  late int _num1;
  late int _num2;

  late List<String> _answers = [];
  late String _sign;
  late int _answer;

  @override
  void initState() {
    super.initState();
    generateNewQuestion();
  }

  void generateNewQuestion() {
    var num1 = Random().nextInt(10) + 1;
    var num2 = Random().nextInt(10) + 1;
    // Ensure num1 is greater than num2
    if (num1 <= num2) {
      var temp = num1;
      num1 = num2;
      num2 = temp;
    }
    // Generate a random operation
    Operation operation =
        Operation.values[Random().nextInt(Operation.values.length)];
    // Calculate the correct answer based on the selected operation
    int answer;
    switch (operation) {
      case Operation.addition:
        answer = num1 + num2;
        _sign = '+';
        break;
      case Operation.subtraction:
        answer = num1 - num2;
        _sign = '-';
        break;
      case Operation.multiplication:
        answer = num1 * num2;
        _sign = 'x';
        break;
    }

    List<String> answers = [];
    answers.add('$answer');
    answers.add('${(Random().nextInt(20) + 1)}');
    answers.add('${(Random().nextInt(30) + 1)}');
    answers.shuffle();
    setState(() {});
    _num1 = num1;
    _num2 = num2;
    _answers = answers;
    _answer = answer;
  }

  void answerQuestion(String answer) {
    if (int.parse(answer) == _answer) {
      setState(() {
        playerScore += 10;
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'CORRECT!!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.check_circle_outline_rounded,
                      size: 45,
                      color: AppColors.kPrimaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: nextQuestion,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 37,
                        right: 37,
                        top: 7,
                        bottom: 7,
                      ),
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
      return;
    }

    // _timer.cancel();
    Get.offAll(() => LosePage(
          score: playerScore,
          text: 'INCORRECT',
        ));
  }

  void nextQuestion() {
    Get.back();
    generateNewQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Math Game',
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      'SCORE : $playerScore',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Text(
                    '$_num1 $_sign $_num2 = ?',
                    style: const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return AnswerButton(
                    answerNumber: _answers[index],
                    onTap: () => answerQuestion(_answers[index]),
                  );
                },
              ),
            ),
            Image.asset(AssetsData.kLogo, height: 250),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

enum Operation {
  addition,
  subtraction,
  multiplication,
}
