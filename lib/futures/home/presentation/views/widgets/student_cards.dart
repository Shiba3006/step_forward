import 'package:flutter/material.dart';
import 'package:step_forward/futures/aphabet/presentation/views/instruction_main_view.dart';
import 'package:step_forward/futures/aphabet/presentation/views/learn_arabic_view.dart';
import 'package:step_forward/futures/aphabet/presentation/views/learn_english_view.dart';

import 'package:step_forward/futures/aphabet/presentation/views/widgets/card_item.dart';
import 'package:step_forward/futures/aphabet/data/models/card_item_model.dart';
import 'package:step_forward/futures/colors_game/presentation/views/instruction_colors_game.dart';
import 'package:step_forward/futures/counter_game/presentation/views/counter_game_view.dart';
import 'package:step_forward/futures/math_game/presentation/viewes/math_game_view.dart';
import 'package:step_forward/futures/words_game/presentation/viewes/words_game_view.dart';

class Studentcard extends StatelessWidget {
  const Studentcard({super.key});

  @override
  Widget build(BuildContext context) {
    List<CardItemModel> cards = <CardItemModel>[
      CardItemModel(
          title: 'Write English',
          icon: Icons.border_color_rounded,
          widget: const InstructionMainView(
            char: 'A',
            widget: LearnEnglishView(),
          )),
      CardItemModel(
          title: 'Write Arabic',
          icon: Icons.border_color_rounded,
          widget: const InstructionMainView(
            char: 'أ',
            widget: LearnArabicView(),
          )),
      CardItemModel(
          title: 'Colors game',
          icon: Icons.palette_rounded,
          widget: const InstructionColorsGameView()),
      CardItemModel(
          title: 'Words game En',
          icon: Icons.gamepad_rounded,
          widget: const WordFindGameView(
            isInglish: true,
          )),
      CardItemModel(
          title: 'Words game Ar',
          icon: Icons.gamepad_rounded,
          widget: const WordFindGameView(
            isInglish: false,
          )),
      CardItemModel(
          title: 'Math\ngame',
          icon: Icons.exposure_minus_1_rounded,
          widget: const MathGameView()),
      CardItemModel(
          title: 'Counting game',
          icon: Icons.calculate_rounded,
          widget: const CountingGameView()),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        itemCount: cards.length,
        padding: const EdgeInsets.only(bottom: 30),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, index) => CardItem(
          cardItemModel: cards[index],
        ),
      ),
    );
  }
}
