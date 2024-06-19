import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_forward/core/widgets/custom_appbar.dart';
import 'package:step_forward/futures/aphabet/presentation/view_model/alphabet_learn_cubit/alphabet_learn_cubit.dart';

import 'package:step_forward/futures/aphabet/presentation/views/widgets/instruction_alphabet.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/instruction_bottom_bar.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/instruction_controll_drawing.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/instruction_next_text.dart';

class Instruction2View extends StatelessWidget {
  const Instruction2View({
    super.key,
    required this.char,
  });
  final String char;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AlphabetLearnCubit>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Instruction',
      ),
      body: Column(
        children: [
          InstructionAlphabet(
            char: char,
          ),
          const SizedBox(
            height: 400,
            child: Stack(
              children: [
                InstructionNextText(),
                InstructionControllDrawing(),
                Positioned(
                  top: 235,
                  right: 100,
                  child: Row(
                    children: [
                      Text(
                        '  Click on next to\nchange the alphabet',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_backspace_rounded,
                        size: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: InstructionBottomBar(cubit: cubit),
    );
  }
}
