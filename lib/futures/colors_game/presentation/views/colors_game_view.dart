import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:step_forward/core/widgets/custom_button.dart';
import 'package:step_forward/futures/colors_game/presentation/view_model/colors_game_cubit/colors_game_cubit.dart';
import 'package:step_forward/futures/colors_game/presentation/views/widgets/color_box.dart';
import 'package:step_forward/futures/colors_game/presentation/views/widgets/score_text.dart';
import 'package:step_forward/futures/home/presentation/views/home_view.dart';

class ColorsGameView extends StatelessWidget {
  const ColorsGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors Game'),
        leading: IconButton(
            onPressed: () => Get.to(() => const HomeView()),
            icon: const Icon(Icons.home_rounded)),
      ),
      body: BlocConsumer<ColorsGameCubit, ColorsGameState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<ColorsGameCubit>(context);
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) => ColorBox(
                    color: cubit.currentBox == index
                        ? cubit.currentColor!.withOpacity(cubit.currentOpacity)
                        : cubit.currentColor!,
                    indexBox: index,
                    onTab: () => cubit.boxListener(index),
                    isPlaying: cubit.isPlaying,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                cubit.status,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ScoreText(
                text: 'Top score: ${cubit.topScore}',
              ),
              const SizedBox(
                height: 10,
              ),
              ScoreText(
                text: 'Your score: ${cubit.currentScore}',
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomButton(
                  buttonText: cubit.btnTitle,
                  onPressed: () => cubit.startListener(),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          );
        },
      ),
    );
  }
}
