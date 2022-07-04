part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInitEvent extends HomeEvent {
  const HomeInitEvent();

  @override
  List<Object?> get props => [];
}

class HomeInitSignalViewEvent extends HomeEvent {
  const HomeInitSignalViewEvent(this.tag);

  final String tag;

  @override
  List<Object?> get props => [tag];
}
