import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_forward/futures/aphabet/presentation/view_model/alphabet_learn_cubit/alphabet_learn_cubit.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/builder_color.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlphabetLearnCubit, AlphabetLearnState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<AlphabetLearnCubit>(context);

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
                (index) => buildColorChose(
                  isSelected: cubit.selectedColor == cubit.colors[index],
                  color: cubit.colors[index],
                  selectedColor: cubit.selectedColor,
                  onTap: () {
                    cubit.changeColor(cubit.colors[index]);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
