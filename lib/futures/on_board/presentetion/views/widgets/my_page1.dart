import 'package:flutter/material.dart';
import 'package:step_forward/core/utils/app_styles.dart';

class MyPage1 extends StatelessWidget {
  const MyPage1({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/casual-life-3d-girl-sleeping-on-books-with-hands-folded.png',
            ),
            const Text(
              "Learning made for\nEveryone",
              textAlign: TextAlign.center,
              style: Styles.styleTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "A Quick Tour of the\nApp Features",
              textAlign: TextAlign.center,
              style: Styles.styleBody,
            ),
          ],
        ),
      )),
    );
  }
}
