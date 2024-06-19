import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'words_find_game_state.dart';

class WordsFindGameCubit extends Cubit<WordsFindGameState> {
  WordsFindGameCubit() : super(WordsFindGameInitial());
}
