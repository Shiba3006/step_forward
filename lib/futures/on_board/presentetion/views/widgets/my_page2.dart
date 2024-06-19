import 'package:flutter/material.dart';
import 'package:step_forward/core/utils/app_styles.dart';

class MyPage2 extends StatelessWidget {
  const MyPage2({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/silky-accessibility-features.png'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "CHOOSE THE DISABILITY AND BEGIN THE LEARING JOURNEY",
              textAlign: TextAlign.center,
              style: Styles.styleTitle,
            ),
          ],
        ),
      )),
    );
  }
}
