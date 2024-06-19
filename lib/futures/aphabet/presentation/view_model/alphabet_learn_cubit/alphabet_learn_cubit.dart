import 'dart:ui' as ui;


import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_forward/futures/aphabet/data/models/drawing_point_model.dart';
import 'package:step_forward/core/utils/alphabet_list.dart';

part 'alphabet_learn_state.dart';

class AlphabetLearnCubit extends Cubit<AlphabetLearnState> {
  AlphabetLearnCubit() : super(AlphabetLearnInitial());
  int count = 0;

  List<DrawingPointModel> drawingPoints = [];
  Color selectedColor = Colors.black;
  double strokeWidth = 5;

  onPanStart(DragStartDetails details) {
    drawingPoints.add(
      DrawingPointModel(
        details.localPosition,
        Paint()
          ..color = selectedColor
          ..isAntiAlias = true
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round,
      ),
    );
    emit(OnPenStartSuccess());
  }

  onPanUpdate(DragUpdateDetails details) {
    drawingPoints.add(
      DrawingPointModel(
        details.localPosition,
        Paint()
          ..color = selectedColor
          ..isAntiAlias = true
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round,
      ),
    );
    emit(OnPenUpdateSuccess());
  }

  onPanEnd(DragEndDetails details) {
    emit(OnPenEndSuccess());
  }

  final List<Color> colors = <Color>[
    Colors.pink,
    Colors.red,
    Colors.black,
    Colors.yellow,
    Colors.amberAccent,
    Colors.purple,
    Colors.green,
  ];

  changeAlphabet() {
    if (count < kEnglishAlphabet.length - 1) {
      count++;
    } else {
      count = 0;
    }
    emit(AlphabetChangedSuccess());
  }

  /////////////////////////////////
  PainterController? painterController;
  void initPainterController() {
    painterController = PainterController()
      ..setStrokeColor(Colors.black)
      ..setMinStrokeWidth(3)
      ..setMaxStrokeWidth(15)
      ..setBlurSigma(0.0)
      ..setPenType(PenType.paintbrush2)
      ..setBlendMode(ui.BlendMode.srcOver);
  }

  clearDrawingPoints() {
    painterController?.clearContent(clearColor: const Color(0xfff0f0ff));
    emit(DrawingPointsClearedSuccess());
  }

  changeStrokeWidth(double value) {
    painterController?.setMinStrokeWidth(value);
    painterController?.setMaxStrokeWidth(value);
    
    emit(StrokeWidthChangedSuccess());
  }

  changeColor(Color color) {
    painterController?.setStrokeColor(color);
    selectedColor = color;
    emit(ColorChangedSuccess());
  }
}
