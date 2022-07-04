import 'package:flutter/material.dart';
import 'package:game_example/application/application.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'services/firebase_remote_service/firebase_remote_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await FirebaseRemoteService.instance.init();
  runApp(const Application());
}
