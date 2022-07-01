import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../firebase_options.dart';

class FirebaseRemoteConfig{
  FirebaseRemoteConfig._privateConstructor();

  static final FirebaseRemoteConfig _instance = FirebaseRemoteConfig._privateConstructor();

  static FirebaseRemoteConfig get instance => _instance;

  Future<void> init() async{
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
  }
}