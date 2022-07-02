import 'package:flutter/material.dart';

import 'services/firebase_remote_service/firebase_remote_service.dart';
import 'ui/screens/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseRemoteService.instance.init();
  runApp(const MaterialApp(home: HomeScreen()));
}
