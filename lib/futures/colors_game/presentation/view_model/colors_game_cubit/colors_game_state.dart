part of 'colors_game_cubit.dart';

@immutable
sealed class ColorsGameState {}

final class ColorsGameInitial extends ColorsGameState {}

final class UpdateBoxSuccess extends ColorsGameState {}

final class UpdateScoreSuccess extends ColorsGameState {}

final class GameOverState extends ColorsGameState {}
final class BoxListenedSuccess extends ColorsGameState {}
final class StartListeningSuccess extends ColorsGameState {}
 

