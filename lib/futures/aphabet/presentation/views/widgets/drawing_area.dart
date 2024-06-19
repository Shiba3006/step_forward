import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_forward/futures/aphabet/presentation/view_model/alphabet_learn_cubit/alphabet_learn_cubit.dart';

class DrawingArea extends StatelessWidget {
  const DrawingArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlphabetLearnCubit, AlphabetLearnState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<AlphabetLearnCubit>(context);

        return Painter(
          controller: cubit.painterController,
          backgroundColor: const Color(0xFFF0F0F0),
          
          onDrawingEnded: (bytes) async {
            //print(
            //'${cubit.painterController.getPoints()?.length} drawn points');
          },
          size: const Size(double.infinity, 500),
        );
      },
    );
  }
}
