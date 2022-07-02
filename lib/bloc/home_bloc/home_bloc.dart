import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_example/consts/namespace_consts.dart';
import 'package:game_example/services/one_signal_service/one_signal_service.dart';

import '../../services/firebase_remote_service/firebase_remote_service.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<HomeInitEvent>(_init);
    on<HomeCallWebViewEvent>(_callWebView);
  }

  FutureOr<void> _init(HomeInitEvent event, Emitter<HomeState> emit) {
    final String? value = FirebaseRemoteService.instance.getStringByKey('link');
    if (value != null) {
      emit(HomeLoadedState(value));
    } else {
      emit(const HomeErrorState());
    }
  }

  FutureOr<void> _callWebView(HomeCallWebViewEvent event, Emitter<HomeState> emit) {
    try {
      OneSignalService.instance.makeSignal('about', DateTime.now().toString());
    } catch (e) {
      logger.e(e);
    }
  }
}
