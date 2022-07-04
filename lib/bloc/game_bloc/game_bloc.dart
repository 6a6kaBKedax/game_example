import 'dart:async';
import 'dart:convert';

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
    logger.d('im here');
    emit(const GameLoadingState(null, true));
    try {
      final Box box = await Hive.openBox(HiveBoxesConsts.historyHiveBoxName);
      final data = await box.get(HiveBoxesConsts.historyHiveBoxKey);
      logger.d(data);
      await box.close();
      if (data != null) {
        final List<GameHistoryModel> score = jsonDecode(data);
        emit(GameLoadedState(score, state.soundStatus));
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
      newList.add(newScore);
      emit(GameLoadedState(newList, state.soundStatus));
      final Box box = await Hive.openBox(HiveBoxesConsts.historyHiveBoxName);
      await box.put(HiveBoxesConsts.historyHiveBoxKey, jsonEncode(newList));
      await box.close();
    } catch (e) {
      logger.e(e);
      emit(GameLoadedState(state.results, state.soundStatus));
    }
  }

  FutureOr<void> _makeSound(GameMakeSoundEvent event, Emitter<GameState> emit) {
    if (state.soundStatus) {
      _player.play(AssetSource(event.path));
    }
  }

  void _changeSoundStatus(GameChangeSoundStatusEvent event, Emitter<GameState> emit) {
    emit(GameLoadedState(state.results, !state.soundStatus));
  }
}
