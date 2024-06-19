part of 'alphabet_learn_cubit.dart';

@immutable
sealed class AlphabetLearnState {}

final class AlphabetLearnInitial extends AlphabetLearnState {}

// final class AlphabetCountSuccess extends AlphabetLearnState {}

final class OnPenStartSuccess extends AlphabetLearnState {}

final class OnPenUpdateSuccess extends AlphabetLearnState {}

final class OnPenEndSuccess extends AlphabetLearnState {}

final class StrokeWidthChangedSuccess extends AlphabetLearnState {}

final class DrawingPointsClearedSuccess extends AlphabetLearnState {}

final class ColorChangedSuccess extends AlphabetLearnState {}

final class AlphabetChangedSuccess extends AlphabetLearnState {}
//////////////////////////////////////////////////////////////////////
final class PointsControllerSuccess extends AlphabetLearnState {}