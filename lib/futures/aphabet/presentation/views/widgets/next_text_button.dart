import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_forward/futures/aphabet/presentation/view_model/alphabet_learn_cubit/alphabet_learn_cubit.dart';

class NextTextButton extends StatelessWidget {
  const NextTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: MediaQuery.of(context).size.height / 3.5,
      child: TextButton(
          onPressed: () {
            BlocProvider.of<AlphabetLearnCubit>(context).changeAlphabet();
          },
          child: const Text(
            'NEXT...',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          )),
    );
  }
}
