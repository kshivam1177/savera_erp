import 'package:flutter/foundation.dart';

import 'services/storage/preference/app_preferences.dart';

abstract class CoreInitializers {
  static final updateValueProvider = ValueNotifier<String?>(null);

  // static Config config;

  static Future<void> init() async {
    print('CoreInitializers init');
    await AppPreference.init();
    // await initNewRelic();
  }
}
