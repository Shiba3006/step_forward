
import 'package:flutter/material.dart';

class InstructionNextText extends StatelessWidget {
  const InstructionNextText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: MediaQuery.of(context).size.height / 3.5,
      child: const Text(
        'NEXT...',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
    );
  }
}
