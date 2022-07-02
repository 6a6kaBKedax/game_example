import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../consts/namespace_consts.dart';
import '../../firebase_options.dart';

class FirebaseRemoteService {
  FirebaseRemoteService._privateConstructor();

  static final FirebaseRemoteService _instance = FirebaseRemoteService._privateConstructor();

  static FirebaseRemoteService get instance => _instance;

  late final FirebaseRemoteConfig _remoteConfig;

  Future<void> init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    _remoteConfig = FirebaseRemoteConfig.instance;
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await _remoteConfig.setDefaults(const {'link': 'google.com'});
    await _remoteConfig.fetchAndActivate();
  }

  String? getStringByKey(String key) {
    try {
      final String value = _remoteConfig.getString(key);
      return value;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }
}
