
import 'package:flutter/material.dart';
import 'package:step_forward/futures/aphabet/presentation/view_model/alphabet_learn_cubit/alphabet_learn_cubit.dart';

class InstructionBottomBar extends StatelessWidget {
  const InstructionBottomBar({
    super.key,
    required this.cubit,
  });

  final AlphabetLearnCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 100,
      child: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            cubit.colors.length,
            growable: false,
            (index) => Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: cubit.colors[index],
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
