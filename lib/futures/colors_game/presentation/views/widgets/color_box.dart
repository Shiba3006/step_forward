
import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  const ColorBox({
    super.key,
    required this.color,
    required this.indexBox,
    required this.onTab,
    required this.isPlaying,
  });
  final Color color;
  final int indexBox;
  final Function() onTab;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isPlaying ? onTab : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: color,
        ),
      ),
    );
  }
}
