import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:step_forward/core/utils/app_colors.dart';
import 'package:step_forward/core/utils/assets_data.dart';
import 'package:step_forward/core/widgets/custom_appbar.dart';
import 'package:step_forward/futures/counter_game/data/models/counter_model.dart';

class CountingGameView extends StatefulWidget {
  const CountingGameView({super.key});

  @override
  State<CountingGameView> createState() => _CountingGameViewState();
}

class _CountingGameViewState extends State<CountingGameView> {
  final Random _random = Random();
  late int _correctAnswer;
  late List<int> _answerOptions;
  final List<CounterModel> _modelList = [
    CounterModel(image: 'assets/images/car.png', name: 'Cars'),
    CounterModel(image: 'assets/images/banana.png', name: 'bananas'),
  ];
  late CounterModel _currentModel;

  @override
  void initState() {
    super.initState();
    _generateNewQuestion();
  }

  void _generateNewQuestion() {
    _correctAnswer = _random.nextInt(10) + 1;

    _currentModel = _modelList[_random.nextInt(_modelList.length)];

    // Use a set to store unique answer options
    Set<int> uniqueOptions = {};

    // Generate incorrect answer options
    while (uniqueOptions.length < 3) {
      int randomOption = _random.nextInt(10) + 1;
      if (randomOption != _correctAnswer) {
        uniqueOptions.add(randomOption);
      }
    }

    // Convert the set to a list
    _answerOptions = uniqueOptions.toList();

    // Ensure correct answer is included
    int randomIndex = _random.nextInt(4);
    if (randomIndex == 4) randomIndex = 3; // Avoid out of bounds error
    _answerOptions.insert(randomIndex, _correctAnswer);

    _answerOptions.shuffle(); // Shuffle the answer options
  }

  void _checkAnswer(int selectedAnswer) {
    String message;
    bool isCorrect;
    if (selectedAnswer == _correctAnswer) {
      message = 'Correct!';
      isCorrect = true;
    } else {
      message = 'Incorrect! Try again.';
      isCorrect = false;
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              if (isCorrect) {
                Get.back();
                _generateNewQuestion(); // Generate a new question
                setState(() {}); // Refresh the UI
              } else {
                Get.back();
              }
            },
            child: Text(
              isCorrect ? 'Next' : 'Try again',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Counting Game',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Display a grid of images equal to the correct answer
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // crossAxisCount: _correctAnswer,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                  ),
                  children: List.generate(
                    _correctAnswer,
                    (_) => Image.asset(
                      _currentModel.image!, // Change the image path as needed
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'What is the number of ${_currentModel.name}?',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // Display the answer options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _answerOptions.map((answer) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                          minimumSize: const Size(60, 60),
                          shape: const CircleBorder()),
                      onPressed: () => _checkAnswer(answer),
                      child: Text('$answer',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          )),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Image.asset(AssetsData.kLogo, height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
