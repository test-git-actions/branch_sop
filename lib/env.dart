import 'package:branch_links/core/constants/constants.dart';
import 'package:get_it/get_it.dart';

enum Flavor {
  dev,
  prod;

  static Flavor fromString(String flavorString) {
    try {
      return Flavor.values.firstWhere(
        (element) => element.name == flavorString,
      );
    } catch (e) {
      return Flavor.dev;
    }
  }
}

enum Environment {
  uat,
  qa4,
  preProd,
  prod,
}

class Env {
  static Env? _singleton;
  static GetIt sl = GetIt.instance;

  /// Determines which of the two firebase projects we should use.
  late final Flavor _flavor;

  /// selects the dev environment when working on the dev flavor.
  late Environment _devEnvironment;

  Env._([Flavor? flavor]) {
    _flavor = flavor ??
        Flavor.fromString(
          const String.fromEnvironment('FLAVOR', defaultValue: 'dev'),
        );
    _devEnvironment = isProdApp ? Environment.prod : Environment.uat;
  }
  factory Env.test(Flavor flavor) {
    return _singleton = Env._(flavor);
  }

  bool get isDevApp => _flavor == Flavor.dev;

  bool get isProdApp => _flavor == Flavor.prod;

  factory Env() {
    _singleton ??= Env._();
    return _singleton!;
  }

  static const devEnvironments = [
    Environment.uat,
    Environment.qa4,
    Environment.preProd,
  ];

  Environment get environment => _devEnvironment;

  set environment(Environment env) {
    if (_flavor == Flavor.dev) {
      _devEnvironment = env;
    }
  }

  String get branchKey {
    if (_flavor == Flavor.prod) {
      return Constants.prodBranchKey;
    }
    return switch (_devEnvironment) {
      Environment.uat => Constants.devBranchKey,
      Environment.qa4 => Constants.devBranchKey,
      Environment.preProd => Constants.devBranchKey,
      Environment.prod => Constants.prodBranchKey,
    };
  }
}
