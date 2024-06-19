import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/drawing_area.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/drawing_control_area.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/next_text_button.dart';

class DrawingStack extends StatelessWidget {
  const DrawingStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        DrawingArea(),
        DrawingControlArea(),
        NextTextButton(),
      ],
    );
  }
}
