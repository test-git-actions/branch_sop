import 'package:branch_links/firebase_options.dart';
import 'package:branch_links/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:integration_test/integration_test.dart';

Future setupApp() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(isDev: true),
  );
  configureInjection();
}
