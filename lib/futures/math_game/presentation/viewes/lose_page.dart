import 'package:flutter/material.dart';
import 'package:step_forward/core/utils/app_colors.dart';
import 'package:step_forward/futures/home/presentation/views/home_view.dart';
import 'package:step_forward/futures/math_game/presentation/viewes/math_game_view.dart';
import 'package:step_forward/futures/math_game/presentation/viewes/widgets/action_button.dart';

class LosePage extends StatefulWidget {
  final score;
  final text;
  const LosePage({super.key, required this.score, required this.text});

  @override
  State<LosePage> createState() => _LosePageState();
}

class _LosePageState extends State<LosePage> {
  void restartGame() {
    final route = MaterialPageRoute(
      builder: (context) => const MathGameView(),
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  void mainMenu() {
    final route = MaterialPageRoute(
      builder: (context) => const HomeView(),
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      widget.text,
                      style: const TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      'SCORE : ${widget.score}',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: ActionButton(
                  info: 'RESTART',
                  bgColor: AppColors.kPrimaryColor,
                  callBack: restartGame,
                ),
              ),
              Expanded(
                flex: 0,
                child: ActionButton(
                  info: 'MAIN MENU',
                  bgColor: AppColors.kPrimaryColor,
                  callBack: mainMenu,
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
