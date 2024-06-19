import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'colors_game_state.dart';

class ColorsGameCubit extends Cubit<ColorsGameState> {
  ColorsGameCubit() : super(ColorsGameInitial());

  Color? currentColor;
  final random = Random.secure();
  int? currentBox;
  double currentOpacity = 1.0;
  int currentScore = 0;
  int topScore = 0;
  String status = 'START';
  String btnTitle = 'START';
  bool isPlaying = false;

  int get randomBox {
    return random.nextInt(9);
  }

  int get randomColorCode {
    return random.nextInt(255);
  }

  Color get randomColor {
    return Color.fromARGB(
      randomColorCode,
      randomColorCode,
      randomColorCode,
      1,
    );
  }

  void updateBox() {
    currentColor = randomColor;
    currentBox = randomBox;
    emit(UpdateBoxSuccess());
  }

  void boxListener(int indexBox) {
    if (indexBox == currentBox) {
      if (currentOpacity < 1.0) {
        currentOpacity =
            double.parse((currentOpacity + 0.1).toStringAsFixed(1));
      }
      currentScore++;
      if (currentScore > topScore) {
        topScore++;
      }
      emit(UpdateScoreSuccess());
      updateBox();
    } else {
      currentScore = 0;
      status = 'GAME OVER';
      isPlaying = false;
      emit(GameOverState());
    }
    emit(BoxListenedSuccess());
  }

  void startListener() {
    currentOpacity = 0.1;
    currentScore = 0;
    status = 'PLAYING';
    btnTitle = 'RESTART';
    isPlaying = true;
    emit(StartListeningSuccess());
    updateBox();
  }
}
