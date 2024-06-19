import 'package:flutter/foundation.dart';

abstract class CoreInitializers {
  static final updateValueProvider = ValueNotifier<String?>(null);
  // static Config config;

  static Future<void> init() async {
    print('CoreInitializers init');
    // await initNewRelic();
  }
}
