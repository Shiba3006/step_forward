import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:step_forward/futures/aphabet/presentation/views/instruction1_view.dart';
import 'package:step_forward/futures/aphabet/presentation/views/instruction2_view.dart';
import 'package:step_forward/futures/aphabet/presentation/views/instruction3_view.dart';

class InstructionMainView extends StatefulWidget {
  const InstructionMainView(
      {super.key, required this.char, required this.widget});
  final String char;
  final Widget widget;
  @override
  State<InstructionMainView> createState() => _InstructionMainViewState();
}

class _InstructionMainViewState extends State<InstructionMainView>
    with TickerProviderStateMixin {
  late PageController pageViewController = PageController();
  late TabController tabController;
  int _currentPageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPageIndex < 2) {
        _currentPageIndex++;
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAll(
            widget.widget,
            transition: Transition.rightToLeft,
          );
        });
      }
      pageViewController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });

    tabController = TabController(
      length: 3,
      vsync: this,
      animationDuration: const Duration(milliseconds: 1000),
    );
  }

  @override
  dispose() {
    _timer?.cancel();
    super.dispose();
    pageViewController.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: _handlePageViewChanged,
            controller: pageViewController,
            children: <Widget>[
              Instruction1View(
                char: widget.char,
              ),
              Instruction2View(
                char: widget.char,
              ),
              Instruction3View(
                char: widget.char,
              ),
            ],
          ),

          // DotsIndicator(
          //     dotsCount: 3,
          //     position: _currentPageIndex,
          //     reversed: false,
          //     decorator: const DotsDecorator(
          //       size: Size.square(15),
          //       activeSize: Size(30, 15),
          //       activeShape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(5)),
          //       ),
          //       color: Colors.grey,
          //       spacing: EdgeInsets.symmetric(vertical: 50, horizontal: 5),
          //     )),
          Positioned(
            top: 60,
            right: 20,
            child: TextButton(
              onPressed: () {
                Get.offAll(
                  () => widget.widget,
                );
              },
              child: const Text(
                'SKIP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }
}
