import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  OneSignalService._privateConstructor();

  static final OneSignalService _instance = OneSignalService._privateConstructor();

  static OneSignalService get instance => _instance;

  Future<void> init() async {
    OneSignal.shared.setAppId('db5e9fe9-71bb-4797-ac5a-1fbb943a2202');
  }
  
  Future<void> makeSignal(String key, dynamic data) async {
    await OneSignal.shared.sendTag(key, data);
  }
}
