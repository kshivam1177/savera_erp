import 'dart:async';

import 'package:flutter/material.dart';
import 'core_initlizers.dart';
import 'main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CoreInitializers.init();

  runZonedGuarded(() async {
    // FlutterError.onError = NewrelicMobile.onError;
    runApp(SaveraERP());
  }, (Object error, StackTrace stackTrace) {});
}
