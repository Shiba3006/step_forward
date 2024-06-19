import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:step_forward/futures/home/presentation/views/widgets/custom_nav_item.dart';

import 'package:step_forward/futures/home/presentation/views/widgets/student_cards.dart';
import 'package:step_forward/futures/profile/presentation/views/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [const Studentcard(), const ProfileView()];
    List<String> appBarTitles = ['The Student', 'My Profile'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            // const Text('Welcome'),
            Text(appBarTitles[currentIndex!]),
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body:
          //  const Studentcard(),
          screens[currentIndex!],
      bottomNavigationBar: ConvexAppBar(
        height: 60,
        backgroundColor: Colors.white,
        color: Colors.grey,
        items: [
          customNavItem(
            icon: Icons.face_outlined,
            activeIcon: Icons.face,
          ),
          customNavItem(
            icon: Icons.person_outlined,
            activeIcon: Icons.person,
          ),
        ],
        onTap: (int i) {
          setState(() {});
          currentIndex = i;
        },
      ),
    );
  }
}
