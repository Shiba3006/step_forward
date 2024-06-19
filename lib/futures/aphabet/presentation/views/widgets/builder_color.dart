import 'package:flutter/material.dart';

Widget buildColorChose({
  required Color color,
  required Color selectedColor,
  required void Function() onTap,
  required bool isSelected,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: isSelected ? 65 : 40,
      width: isSelected ? 65 : 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(
                color: Colors.white,
                width: 3,
              )
            : null,
      ),
    ),
  );
}
