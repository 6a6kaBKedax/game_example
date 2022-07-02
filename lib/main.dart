import 'package:flutter/material.dart';
import 'package:game_example/application/application.dart';

import 'services/firebase_remote_service/firebase_remote_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseRemoteService.instance.init();
  runApp(const Application());
}
