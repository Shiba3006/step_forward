import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_forward/futures/aphabet/presentation/view_model/alphabet_learn_cubit/alphabet_learn_cubit.dart';

class DrawingControlArea extends StatelessWidget {
  const DrawingControlArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlphabetLearnCubit, AlphabetLearnState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<AlphabetLearnCubit>(context);
        return Positioned(
          top: 40,
          right: 30,
          child: Row(
            children: [
              Slider(
                min: 1,
                max: 20,
                value: cubit.painterController?.getState()?.strokeMinWidth ?? 0,
                onChanged: (val) => cubit.changeStrokeWidth(val),
              ),
              ElevatedButton.icon(
                onPressed: () => cubit.clearDrawingPoints(),
                icon: const Icon(Icons.clear),
                label: const Text("Clear Board"),
              )
            ],
          ),
        );
      },
    );
  }
}
