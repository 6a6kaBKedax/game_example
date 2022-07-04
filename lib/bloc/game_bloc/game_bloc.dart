import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_example/consts/static_strings.dart';
import 'package:hive/hive.dart';

import '../../consts/namespace_consts.dart';
import '../../data/models/game_history_model.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameLoadedState(null, true)) {
    on<GameInitEvent>(_init);
    on<GameAddToHistoryEvent>(_addNewValue);
    on<GameMakeSoundEvent>(_makeSound);
    on<GameChangeSoundStatusEvent>(_changeSoundStatus);
    _player = AudioPlayer();
  }

  late final AudioPlayer _player;

  Future<void> _init(GameInitEvent event, Emitter<GameState> emit) async {
    emit(const GameLoadingState(null, true));
    try {
      final Box box = Hive.box<List<dynamic>>(HiveBoxesConsts.historyHiveBoxName);
      final data = await box.get(HiveBoxesConsts.historyHiveBoxKey);
      if (data != null) {
        final List<GameHistoryModel> newList = [];
        (data as List<dynamic>).forEach((e) => newList.add(e));
        emit(GameLoadedState(newList, state.soundStatus));
      } else {
        throw Exception(data);
      }
    } on Exception catch (e) {
      logger.e(e);
      emit(GameLoadedState(state.results, state.soundStatus));
    }
  }

  Future<void> _addNewValue(GameAddToHistoryEvent event, Emitter<GameState> emit) async {
    emit(GameLoadingState(state.results, state.soundStatus));
    try {
      final GameHistoryModel newScore = GameHistoryModel(points: event.points, time: DateTime.now());
      final List<GameHistoryModel> newList = [...?state.results, newScore];
      emit(GameLoadedState(newList, state.soundStatus));
      final Box box = Hive.box<List<dynamic>>(HiveBoxesConsts.historyHiveBoxName);
      await box.clear();
      await box.put(HiveBoxesConsts.historyHiveBoxKey, newList);
    } catch (e) {
      logger.e(e);
      emit(GameLoadedState(state.results, state.soundStatus));
    }
  }

  FutureOr<void> _makeSound(GameMakeSoundEvent event, Emitter<GameState> emit) async {
    if (state.soundStatus) {
      await _player.play(AssetSource(event.path));
    }
  }

  void _changeSoundStatus(GameChangeSoundStatusEvent event, Emitter<GameState> emit) {
    emit(GameLoadedState(state.results, !state.soundStatus));
  }
}
