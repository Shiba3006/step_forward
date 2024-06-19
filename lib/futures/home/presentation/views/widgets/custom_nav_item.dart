import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:step_forward/core/utils/app_colors.dart';

TabItem<dynamic> customNavItem({
  required IconData activeIcon,
  required IconData icon,
}) {
  return TabItem(
    activeIcon: Icon(
      activeIcon,
      size: 50,
      color: AppColors.kPrimaryColor,
    ),
    icon: Icon(
      icon,
      color: AppColors.kPrimaryColor,
    ),
  );
}
