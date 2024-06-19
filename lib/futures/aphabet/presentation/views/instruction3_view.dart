import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_forward/core/widgets/custom_appbar.dart';
import 'package:step_forward/futures/aphabet/presentation/view_model/alphabet_learn_cubit/alphabet_learn_cubit.dart';

import 'package:step_forward/futures/aphabet/presentation/views/widgets/instruction_alphabet.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/instruction_bottom_bar.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/instruction_controll_drawing.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/instruction_next_text.dart';

class Instruction3View extends StatelessWidget {
  const Instruction3View({super.key, required this.char});
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
            height: 500,
            child: Stack(
              children: [
                InstructionNextText(),
                InstructionControllDrawing(),
                Positioned(
                  top: 350,
                  right: 120,
                  child: Column(
                    children: [
                      Text(
                        '  Click here to\nchange the color',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_downward_rounded,
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
