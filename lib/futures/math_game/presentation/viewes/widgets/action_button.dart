import 'package:flutter/material.dart';


class ActionButton extends StatelessWidget {
  final String info;
  final Color bgColor;
  final VoidCallback callBack;

  const ActionButton(
      {super.key,
      required this.info,
      required this.bgColor,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: callBack,
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 55,
              bottom: 8,
              right: 55,
            ),
            child: Text(
              info,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
