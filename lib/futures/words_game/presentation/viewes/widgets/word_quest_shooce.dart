// import 'package:flutter/material.dart';
// import 'package:step_forward/futures/words_game/data/models/word_find_quest_model.dart';

// class WordQuestionShooce extends StatefulWidget {
//   const WordQuestionShooce(
//       {super.key,
//       required this.currentQues,
//       required this.listQuestions,
//       required this.indexQues,
//       required this.generatePuzzle, required this.isEnglish});
//   final WordFindQuesModel currentQues;
//   final List<WordFindQuesModel>? listQuestions;
//   final int indexQues;
//   final generatePuzzle;
//   final bool isEnglish;
//   @override
//   State<WordQuestionShooce> createState() => _WordQuestionShooceState();
// }

// class _WordQuestionShooceState extends State<WordQuestionShooce> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       alignment: Alignment.center,
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           childAspectRatio: 1,
//           crossAxisCount: 8,
//           crossAxisSpacing: 4,
//           mainAxisSpacing: 4,
//         ),
//         itemCount: 16, // later change
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           bool statusBtn = widget.currentQues.puzzles
//                   .indexWhere((puzzle) => puzzle.currentIndex == index) >=
//               0;

//           return LayoutBuilder(
//             builder: (context, constraints) {
//               Color color =
//                   statusBtn ? Colors.white70 : const Color(0xff7EE7FD);

//               return Container(
//                 decoration: BoxDecoration(
//                   color: color,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 // margin: ,
//                 alignment: Alignment.center,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(50, constraints.biggest.height),
//                   ),
//                   child: Text(
//                     widget.currentQues.arrayBtns![index].toUpperCase(),
//                     style: const TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onPressed: () {
//                     if (!statusBtn) {
//                       setBtnClick(index);
//                     }
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   Future<void> setBtnClick(int index) async {
//     WordFindQuesModel currentQues = widget.listQuestions![widget.indexQues];

//     int currentIndexEmpty =
//         currentQues.puzzles.indexWhere((puzzle) => puzzle.currentValue == null);

//     if (currentIndexEmpty >= 0) {
//       currentQues.puzzles[currentIndexEmpty].currentIndex = index;
//       currentQues.puzzles[currentIndexEmpty].currentValue =
//           currentQues.arrayBtns![index];

//       if (currentQues.fieldCompleteCorrect(widget.isEnglish)) {
//         currentQues.isDone = true;

//         setState(() {});

//         await Future.delayed(const Duration(seconds: 1));
//         widget.generatePuzzle;
//       }
//       setState(() {});
//     }
//   }
// }
