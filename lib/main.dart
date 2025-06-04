import 'package:branch_links/core/screens/my_app.dart';
import 'package:branch_links/env.dart';
import 'package:branch_links/firebase_options.dart';
import 'package:branch_links/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart' as intl;
import 'package:logging/logging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    (record) {
      debugPrint('${record.level.name}: ${record.time}: ${record.message}');
      if (record.error != null) {
        debugPrint(record.error.toString());
        debugPrint(record.stackTrace.toString());
      }
    },
  );
  initializeDateFormatting('en_US');
  usePathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(isDev: Env().isDevApp),
  );

  await intl.findSystemLocale();

  configureInjection();
  return runApp(const MyApp());
}
