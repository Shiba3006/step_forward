import 'package:flutter/material.dart';
import 'package:step_forward/core/utils/assets_data.dart';
import 'package:step_forward/core/utils/constants.dart';
import 'package:step_forward/core/widgets/contact_us_text_button.dart';
import 'package:step_forward/futures/splash/views/widgets/sliding_text.dart';
import 'package:step_forward/futures/on_board/on_board_view.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initSlidingText();
    navigateToOnBoard();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ContactUsTextButton(),
            Image.asset(
              AssetsData.kLogo,
            ),
            const SizedBox(
              height: 50,
            ),
            SlidingText(slidingAnimation: slidingAnimation),
          ],
        ),
      ),
    );
  }

  void initSlidingText() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToOnBoard() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(const OnBoardView(),
          transition: Transition.rightToLeft, duration: kTransationDuration);
    });
  }
}
