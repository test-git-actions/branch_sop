// ignore_for_file: avoid_print

import 'dart:io';

import 'package:pubspec_parse/pubspec_parse.dart';

class PubspecScanner {
  static const kPubspecDescription = 'PUBSPEC_DESCRIPTION';
  static const kPubspecFlutterSdk = 'PUBSPEC_FLUTTER_SDK';
  static const kPubspecName = 'PUBSPEC_NAME';
  static const kPubspecPublishTo = 'PUBSPEC_PUBLISH_TO';
  static const kPubspecRepository = 'PUBSPEC_REPOSITORY';
  static const kPubspecVersion = 'PUBSPEC_VERSION';
  static const kPubspecVersionMajor = 'PUBSPEC_VERSION_MAJOR';
  static const kPubspecVersionMinor = 'PUBSPEC_VERSION_MINOR';
  static const kPubspecVersionPatch = 'PUBSPEC_VERSION_PATCH';
  static const kPubspecVersionPreRelease = 'PUBSPEC_VERSION_PRE_RELEASE';

  PubspecInfo scan(File file) {
    if (!file.existsSync()) {
      print('Error: The file ${file.path} does not exist.');
      exit(1);
    }
    final contents = file.readAsStringSync();

    final pubspec = Pubspec.parse(contents);

    final name = pubspec.name;

    if (name.isEmpty) {
      print('Error: The pubspec.yaml file does not contain a name.');
      exit(1);
    }

    final version = pubspec.version;

    if (version == null) {
      print('Error: The pubspec.yaml file does not contain a version.');
      exit(1);
    }

    final major = version.major;
    final minor = version.minor;
    final patch = version.patch;
    final preRelease = version.preRelease;

    final publishTo = pubspec.publishTo;
    final repository = pubspec.repository?.toString() ?? pubspec.homepage;

    final dependencies = pubspec.dependencies;
    final flutterSsk = dependencies.containsKey('flutter');

    final info = PubspecInfo(
      description: pubspec.description ?? '',
      flutterSdk: flutterSsk,
      name: name,
      major: major,
      minor: minor,
      patch: patch,
      preRelease: preRelease.join(''),
      publishTo: publishTo ?? '',
      repository: repository ?? '',
      version: version.toString(),
    );

    return info;
  }
}

class PubspecInfo {
  final String description;
  final bool flutterSdk;
  final String name;
  final int major;
  final int minor;
  final int patch;
  final String preRelease;
  final String publishTo;
  final String repository;
  final String version;

  PubspecInfo({
    required this.description,
    required this.flutterSdk,
    required this.name,
    required this.major,
    required this.minor,
    required this.patch,
    required this.preRelease,
    required this.publishTo,
    required this.repository,
    required this.version,
  });

  Map<String, String> toMap() => {
        PubspecScanner.kPubspecDescription: description,
        PubspecScanner.kPubspecFlutterSdk: flutterSdk.toString(),
        PubspecScanner.kPubspecName: name,
        PubspecScanner.kPubspecPublishTo: publishTo,
        PubspecScanner.kPubspecRepository: repository,
        PubspecScanner.kPubspecVersion: version,
        PubspecScanner.kPubspecVersionMajor: major.toString(),
        PubspecScanner.kPubspecVersionMinor: minor.toString(),
        PubspecScanner.kPubspecVersionPatch: patch.toString(),
        PubspecScanner.kPubspecVersionPreRelease: preRelease,
      };
}
