import 'package:flutter/material.dart';
import 'package:game_example/application/application.dart';
import 'package:game_example/data/models/game_history_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'consts/static_strings.dart';
import 'services/firebase_remote_service/firebase_remote_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(GameHistoryModelAdapter());
  if(!Hive.isBoxOpen(HiveBoxesConsts.historyHiveBoxName)){
    await Hive.openBox<List<dynamic>>(HiveBoxesConsts.historyHiveBoxName);
  }
  await FirebaseRemoteService.instance.init();
  runApp(const Application());
}
