// import 'package:flutter/cupertino.dart';
// import 'package:step_forward/futures/colors_game/presentation/views/widgets/color_box.dart';

// class GridColors extends StatefulWidget {
//   const GridColors(
//       {super.key,
//       required this.currentBox,
//       required this.currentColor,
//       required this.currentOpacity,
//       required this.isPlaying,
//       required this.onTab});
//   final int currentBox;
//   final Color currentColor;
//   final double currentOpacity;
//   final bool isPlaying;
//   final Function(int index) onTab;
//   @override
//   State<GridColors> createState() => _GridColorsState();
// }

// class _GridColorsState extends State<GridColors> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GridView.builder(
//         itemCount: 9,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//         ),
//         itemBuilder: (context, index) => ColorBox(
//           color: widget.currentBox == index
//               ? widget.currentColor.withOpacity(widget.currentOpacity)
//               : widget.currentColor,
//           indexBox: index,
//           onTab: widget.onTab(index),
//           // () => boxListener(index),
//           isPlaying: widget.isPlaying,
//         ),
//       ),
//     );
//   }
// }
