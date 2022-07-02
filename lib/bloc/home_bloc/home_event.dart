part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInitEvent extends HomeEvent {
  const HomeInitEvent();

  @override
  List<Object?> get props => [];
}

class HomeCallWebViewEvent extends HomeEvent {
  const HomeCallWebViewEvent();

  @override
  List<Object?> get props => [];
}


