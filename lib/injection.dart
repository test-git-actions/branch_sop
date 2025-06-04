import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:branch_links/injection.config.dart';

final GetIt locator = GetIt.instance;

@injectableInit
void configureInjection() {
  locator.init();
}
