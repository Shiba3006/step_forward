import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:step_forward/futures/aphabet/data/models/drawing_point_model.dart';

class DrawingPainter extends CustomPainter {
  final List<DrawingPointModel>? drawingPoints;

  List<Offset> offsetsList = [];

  DrawingPainter({super.repaint, required this.drawingPoints});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < drawingPoints!.length; i++) {
      if (drawingPoints?[i] != null && drawingPoints?[i + 1] != null) {
        canvas.drawLine(drawingPoints![i].offset!, drawingPoints![i + 1].offset!,
            drawingPoints![i].paint!);
      } else if (drawingPoints?[i] != null && drawingPoints?[i + 1] == null) {
        offsetsList.clear();
        offsetsList.add(drawingPoints![i].offset!);

        canvas.drawPoints(
            PointMode.points, offsetsList, drawingPoints![i].paint!);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
