import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/alphabet_detect.dart';
import 'package:step_forward/core/utils/alphabet_list.dart';
import 'package:step_forward/futures/aphabet/presentation/views/widgets/custom_bottom_appbar.dart';

import 'package:step_forward/futures/aphabet/presentation/views/widgets/drawing_stack.dart';
import 'package:step_forward/futures/home/presentation/views/home_view.dart';

class LearnEnglishView extends StatelessWidget {
  const LearnEnglishView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Start Learning',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.to(() => const HomeView()),
          icon: const Icon(Icons.home_filled),
        ),
      ),
      body: const Column(
        children: [
          AlphabetDetect(
            alphabet: kEnglishAlphabet,
          ),
          DrawingStack(),
        ],
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
