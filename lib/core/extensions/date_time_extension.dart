import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get deepLinkDateFormat => DateFormat('y/M/d').format(this);
}
