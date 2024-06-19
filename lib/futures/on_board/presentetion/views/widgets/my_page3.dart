import 'package:flutter/material.dart';
import 'package:step_forward/core/utils/app_styles.dart';

class MyPage3 extends StatelessWidget {
  const MyPage3({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/3d-business-woman-and-little-girl-drawing-together.png'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "* COMMUNITY GUIDANCE\n* ASK EXPERTS\n* LEARN TO TEACH\n* GUIDES AND EDUCATIONAL CONTENT",
              textScaler: TextScaler.linear(1.3),
              style: Styles.styleBody,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
