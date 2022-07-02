import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/firebase_remote_service/firebase_remote_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<HomeInitEvent>(_init);
  }

  FutureOr<void> _init(HomeInitEvent event, Emitter<HomeState> emit) {
    final String? value = FirebaseRemoteService.instance.getStringByKey('link');
    if(value != null){
      emit(HomeLoadedState(value));
    }else{
      emit(const HomeErrorState());
    }
  }
}
