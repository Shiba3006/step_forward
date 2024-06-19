import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_forward/core/utils/assets_data.dart';
import 'package:step_forward/futures/words_game/presentation/viewes/widgets/custom_icon_btn.dart';

class ControllButtons extends StatelessWidget {
  const ControllButtons({
    super.key,
    required this.generatePuzzleBack,
    required this.generatePuzzleNext,
  });

  final Function() generatePuzzleBack;
  final Function() generatePuzzleNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icons.home_rounded),
        Image.asset(AssetsData.kLogo, height: 60),
        Row(
          children: [
            CustomIconButton(
                onPressed: generatePuzzleBack, icon: Icons.arrow_back_ios),
            CustomIconButton(
                onPressed: generatePuzzleNext, icon: Icons.arrow_forward_ios),
          ],
        )
      ],
    );
  }
}
