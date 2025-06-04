import 'package:string_validator/string_validator.dart';

mixin URLValidatorMixin {
  String? validateURL(String value) {
    if (!isURL(value)) {
      return 'This field should be a valid URL';
    }
    return null;
  }
}
