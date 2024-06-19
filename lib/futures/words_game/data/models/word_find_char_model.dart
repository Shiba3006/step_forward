// done
import 'package:audioplayers/audioplayers.dart';

class WordFindCharModel {
  String? currentValue;
  int? currentIndex;
  final String? correctValue;
  bool hintShow;

  WordFindCharModel({
    this.currentValue,
    this.currentIndex,
    required this.correctValue,
    this.hintShow = false,
  });

  getCurrentValue() {
    return currentValue;
  }

  void clearValue() {
    currentIndex = null;
    currentValue = null;
  }

    playSound() {
    final player = AudioPlayer();
    // player.play(AssetSource(sound));
  }
}
