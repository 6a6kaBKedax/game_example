part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState(this.link);

  final String? link;
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(null);

  @override
  List<Object?> get props => [link];
}

class HomeLoadedState extends HomeState {
  const HomeLoadedState(String link) : super(link);

  @override
  List<Object?> get props => [link];
}

class HomeErrorState extends HomeState {
  const HomeErrorState() : super(null);

  @override
  List<Object?> get props => [link];
}

