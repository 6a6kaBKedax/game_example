part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class GameInitEvent extends GameEvent {
  const GameInitEvent();

  @override
  List<Object?> get props => [];
}

class GameMakeSoundEvent extends GameEvent {
  const GameMakeSoundEvent(this.path);
  final String path;
  @override
  List<Object?> get props => [path];
}

class GameChangeSoundStatusEvent extends GameEvent {
  const GameChangeSoundStatusEvent();

  @override
  List<Object?> get props => [];
}

class GameAddToHistoryEvent extends GameEvent {
  const GameAddToHistoryEvent(this.points);

  final int points;

  @override
  List<Object?> get props => [points];
}
