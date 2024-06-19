import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:step_forward/core/utils/app_colors.dart';
import 'package:step_forward/core/widgets/custom_appbar.dart';
import 'package:step_forward/core/widgets/custom_button.dart';
import 'package:step_forward/futures/colors_game/presentation/view_model/colors_game_cubit/colors_game_cubit.dart';
import 'package:step_forward/futures/colors_game/presentation/views/colors_game_view.dart';
import 'package:step_forward/futures/colors_game/presentation/views/widgets/color_box.dart';

class InstructionColorsGameView extends StatelessWidget {
  const InstructionColorsGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Instructions',
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
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Icon(
              //       Icons.call_made_rounded,
              //       size: 150,
              //     ),
              //     SizedBox(width: 50),
              //   ],
              // ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Click on the different colors to get points',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                  onPressed: () => Get.offAll(() => const ColorsGameView()),
                  icon: const Icon(
                    Icons.start_rounded,
                    size: 150,
                    color: AppColors.kPrimaryColor,
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomButton(
                  buttonText: 'Click here to Start',
                  onPressed: () => Get.offAll(() => const ColorsGameView()),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
