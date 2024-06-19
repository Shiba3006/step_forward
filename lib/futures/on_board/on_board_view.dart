import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_forward/futures/auth/presentation/views/sign_in_view.dart';
import 'package:step_forward/futures/auth/presentation/views/sign_up_view.dart';
import 'package:step_forward/futures/on_board/presentetion/views/widgets/my_page1.dart';
import 'package:step_forward/futures/on_board/presentetion/views/widgets/my_page2.dart';
import 'package:step_forward/futures/on_board/presentetion/views/widgets/my_page3.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView>
    with TickerProviderStateMixin {
  late PageController pageViewController = PageController();
  late TabController tabController;
  int _currentPageIndex = 0;
  Timer? _timer;
// 123   //[0,1,2] 
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPageIndex < 2) {
        _currentPageIndex++;
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAll(
            const SignUpView(),
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
              MyPage1(controller: pageViewController),
              MyPage2(controller: pageViewController),
              MyPage3(controller: pageViewController),
            ],
          ),
          
          DotsIndicator(
              dotsCount: 3,
              position: _currentPageIndex,
              reversed: false,
              decorator: const DotsDecorator(
                size: Size.square(15),
                activeSize: Size(30, 15),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                color: Colors.grey,
                spacing: EdgeInsets.symmetric(vertical: 50, horizontal: 5),
              )),
          Positioned(
            top: 60,
            right: 20,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 100),
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                onPressed: () {
                  Get.offAll(const SignInView());
                },
                child: const Text(
                  'Sign In  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
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
