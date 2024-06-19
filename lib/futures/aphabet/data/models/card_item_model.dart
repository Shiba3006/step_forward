import 'package:flutter/material.dart';

class CardItemModel {
  final String title;
  final IconData? icon;
  final Widget widget;

  CardItemModel({required this.title, this.icon, required this.widget});
}
