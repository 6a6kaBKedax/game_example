part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  final List<GameHistoryModel>? results;
  final bool soundStatus;

  const GameState(this.results, this.soundStatus);
}

class GameLoadedState extends GameState {
  const GameLoadedState(List<GameHistoryModel>? value, bool soundStatus) : super(value, soundStatus);

  @override
  List<Object?> get props => [results, soundStatus];
}

class GameLoadingState extends GameState {
  const GameLoadingState(List<GameHistoryModel>? value, bool soundStatus) : super(value, soundStatus);

  @override
  List<Object?> get props => [results, soundStatus];
}
