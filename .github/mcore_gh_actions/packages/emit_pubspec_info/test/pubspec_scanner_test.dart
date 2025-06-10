import 'package:emit_pubspec_info/emit_pubspec_info.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  test('standard pubspec', () {
    final file = MemoryFileSystem().file('pubspec.yaml');

    final content = '''
name: emit_pubspec_info
description: 'Scans a pubspec file and emits the information to a GitHub output'
version: 1.0.0
publish_to: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
repository: https://github.com/mgmri-dge/mcore_gh_actions

environment:
  sdk: ^3.6.0

dependencies:
  args: ^2.5.0
  emit_git_hub_output:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^1.0.0
  file: ^7.0.1
  meta: ^1.17.0
  pubspec_parse: ^1.5.0

dev_dependencies:
  flutter_lints: ^5.0.0
  test: ^1.26.1

dependency_overrides:
  emit_git_hub_output:
    path: ../emit_git_hub_output
''';
    file.writeAsStringSync(content);

    final scanner = PubspecScanner();
    final info = scanner.scan(file);

    expect(info.flutterSdk, false);
    expect(info.name, 'emit_pubspec_info');
    expect(info.version, '1.0.0');
    expect(info.major, 1);
    expect(info.minor, 0);
    expect(info.patch, 0);
    expect(info.preRelease, '');
    expect(
      info.publishTo,
      'https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub',
    );
    expect(info.repository, 'https://github.com/mgmri-dge/mcore_gh_actions');
  });

  test('flutter pubspec', () {
    final file = MemoryFileSystem().file('pubspec.yaml');

    final content = '''
name: mgm_kiosk_fdotf
description: Flutter application for Kiosks
repository: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
publish_to: none
version: 25.8.0

environment:
  sdk: '>=3.1.5 <4.0.0'
  flutter: '>=3.0.0'

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter

  # Internal Packages
  analytics_service:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^3.0.0

  desko_scanner:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^5.0.0

  feature_flag_service:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^1.0.0

  freedom_pay:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^8.0.0

  key_dispenser:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^4.0.0

  kiosk_companion_client:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^2.0.0

  mgm_clients:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^1.0.0

  mgm_remote_logger:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^1.0.0

  mgm_virtual_keyboard:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^1.0.0

  monitoring_service:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^5.0.0

  remote_configuration:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^5.0.0

  rsf:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^1.0.0

  thales_scanner:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^6.0.1

  vega_components:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^3.1.3

  # Public Packages
  android_id: ^0.4.0
  app_links: ^6.3.3
  back_button_interceptor: ^8.0.3
  cached_network_image: ^3.4.1
  cloud_firestore: ^5.5.1
  convert: ^3.1.2
  collection: ^1.19.0
  dartz: ^0.10.1
  device_info_plus: ^11.3.0
  dio: ^5.8.0+1
  encrypt: ^5.0.3
  equatable: ^2.0.5
  firebase_core: ^3.6.0
  firebase_auth: ^5.3.4
  firebase_storage: ^12.4.1
  flutter_bloc: ^9.1.0
  flutter_html: ^3.0.0
  flutter_svg: ^2.0.10+1
  get_it: ^8.0.0
  go_router: ^14.2.8
  gql: ^1.0.0+1
  graphql: ^5.2.1
  graphql_flutter: ^5.2.0
  html: ^0.15.4
  http: ^1.3.0
  intl: '>=0.18.1<2.0.0'
  json_annotation: ^4.9.0
  logging: ^1.2.0
  meta: ^1.15.0
  package_info_plus: ^8.0.2
  path: ^1.9.0
  pretty_qr_code: ^3.3.0
  rive: ^0.13.20
  rxdart: ^0.28.0
  shared_preferences: ^2.4.0
  timezone: ^0.10.0
  uuid: '>=3.0.0 <5.0.0'

dependency_overrides:
  fake_cloud_firestore: ^3.0.3
  http: ^1.0.0
  intl: '>=0.18.1<2.0.0'
  meta: ^1.16.0
  path: ^1.9.1
  sentry_flutter: ^8.11.1
  vega_tokens:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: 1.4.17-xl

dev_dependencies:
  args: ^2.5.0
  bloc_test: ^10.0.0
  build_runner: ^2.4.13
  envied_generator: ^1.1.0
  flutter_driver:
    sdk: flutter
  flutter_lints: ^5.0.0
  flutter_test:
    sdk: flutter
  gql_build: '>=0.7.0 <1.0.0'
  golden_toolkit: ^0.15.0
  integration_test:
    sdk: flutter
  json_serializable: ^6.8.0
  mocktail: ^1.0.4
  network_image_mock: ^2.1.1
  recase: ^4.1.0
  sentry_dart_plugin: ^2.4.1

flutter:
  generate: true
  uses-material-design: true

  assets:
    - assets/svg/
    - assets/graphics/
    - assets/animations/
    - assets/animations/upsell/
    - assets/svg/resort_logos/
    - assets/svg/key_encoder/
    - assets/svg/cards/
    - assets/svg/cards_with_borders/
    - assets/certs/
    - assets/files/

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  fonts:
    - family: Calibre-R
      fonts:
        - asset: assets/fonts/Calibre-R-Regular.otf
        - asset: assets/fonts/Calibre-R-RegularItalic.otf
          style: italic
        - asset: assets/fonts/Calibre-R-Medium.otf
          weight: 500
        - asset: assets/fonts/Calibre-R-MediumItalic.otf
          weight: 500
          style: italic
        - asset: assets/fonts/Calibre-R-Bold.otf
          weight: 700
        - asset: assets/fonts/Calibre-R-BoldItalic.otf
          weight: 700
          style: italic
''';

    file.writeAsStringSync(content);

    final scanner = PubspecScanner();
    final info = scanner.scan(file);

    expect(info.flutterSdk, true);
    expect(info.name, 'mgm_kiosk_fdotf');
    expect(info.version, '25.8.0');
    expect(info.major, 25);
    expect(info.minor, 8);
    expect(info.patch, 0);
    expect(info.preRelease, '');
    expect(
      info.publishTo,
      'none',
    );
    expect(
      info.repository,
      'https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub',
    );

    expect(info.toMap(), {
      PubspecScanner.kPubspecDescription: 'Flutter application for Kiosks',
      PubspecScanner.kPubspecFlutterSdk: 'true',
      PubspecScanner.kPubspecName: 'mgm_kiosk_fdotf',
      PubspecScanner.kPubspecPublishTo: 'none',
      PubspecScanner.kPubspecRepository:
          'https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub',
      PubspecScanner.kPubspecVersion: '25.8.0',
      PubspecScanner.kPubspecVersionMajor: '25',
      PubspecScanner.kPubspecVersionMinor: '8',
      PubspecScanner.kPubspecVersionPatch: '0',
      PubspecScanner.kPubspecVersionPreRelease: '',
    });
  });

  test('build number pubspec', () {
    final file = MemoryFileSystem().file('pubspec.yaml');

    final content = '''
name: test_build_number
version: 1.2.3+4
''';

    file.writeAsStringSync(content);

    final scanner = PubspecScanner();
    final info = scanner.scan(file);

    expect(info.flutterSdk, false);
    expect(info.name, 'test_build_number');
    expect(info.version, '1.2.3+4');
    expect(info.major, 1);
    expect(info.minor, 2);
    expect(info.patch, 3);
    expect(info.preRelease, '');
    expect(info.publishTo, '');
    expect(info.repository, '');

    expect(info.toMap(), {
      PubspecScanner.kPubspecDescription: '',
      PubspecScanner.kPubspecFlutterSdk: 'false',
      PubspecScanner.kPubspecName: 'test_build_number',
      PubspecScanner.kPubspecPublishTo: '',
      PubspecScanner.kPubspecRepository: '',
      PubspecScanner.kPubspecVersion: '1.2.3+4',
      PubspecScanner.kPubspecVersionMajor: '1',
      PubspecScanner.kPubspecVersionMinor: '2',
      PubspecScanner.kPubspecVersionPatch: '3',
      PubspecScanner.kPubspecVersionPreRelease: '',
    });
  });

  test('pre-relese pubspec', () {
    final file = MemoryFileSystem().file('pubspec.yaml');

    final content = '''
name: test_pre-release
version: 1.2.3-beta-3
''';

    file.writeAsStringSync(content);

    final scanner = PubspecScanner();
    final info = scanner.scan(file);

    expect(info.flutterSdk, false);
    expect(info.name, 'test_pre-release');
    expect(info.version, '1.2.3-beta-3');
    expect(info.major, 1);
    expect(info.minor, 2);
    expect(info.patch, 3);
    expect(info.preRelease, 'beta-3');
    expect(info.publishTo, '');
    expect(info.repository, '');

    expect(info.toMap(), {
      PubspecScanner.kPubspecDescription: '',
      PubspecScanner.kPubspecFlutterSdk: 'false',
      PubspecScanner.kPubspecName: 'test_pre-release',
      PubspecScanner.kPubspecPublishTo: '',
      PubspecScanner.kPubspecRepository: '',
      PubspecScanner.kPubspecVersion: '1.2.3-beta-3',
      PubspecScanner.kPubspecVersionMajor: '1',
      PubspecScanner.kPubspecVersionMinor: '2',
      PubspecScanner.kPubspecVersionPatch: '3',
      PubspecScanner.kPubspecVersionPreRelease: 'beta-3',
    });
  });
}
