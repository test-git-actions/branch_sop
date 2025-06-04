import 'package:branch_links/env.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Env env;

  group('dev flavor', () {
    setUp(() {
      env = Env();
    });

    test(
      'should be dev app',
      () {
        expect(
          env.isDevApp,
          true,
        );
      },
    );

    test(
      'should be the default uat environment ',
      () {
        expect(
          env.environment,
          Environment.uat,
        );
      },
    );

    test(
      'should be the qa4 environment ',
      () {
        env.environment = Environment.qa4;
        expect(
          env.environment,
          Environment.qa4,
        );
      },
    );
  });

  group('prod flavor', () {
    setUp(() {
      env = Env.test(Flavor.prod);
    });

    test(
      'should be prod flavor',
      () {
        expect(
          env.isProdApp,
          isTrue,
        );
      },
    );

    test(
      'should be prod environment althought we have changed the environment',
      () {
        env.environment = Environment.qa4;

        expect(
          env.environment,
          Environment.prod,
        );
      },
    );
  });
}
