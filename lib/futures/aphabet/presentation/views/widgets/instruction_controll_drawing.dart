import 'package:flutter/material.dart';

class InstructionControllDrawing extends StatelessWidget {
  const InstructionControllDrawing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 30,
      child: Row(
        children: [
          Slider(
            min: 0,
            max: 40,
            value: 5,
            onChanged: (val) {},
          ),
          Column(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.clear),
                label: const Text("Clear Board"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
