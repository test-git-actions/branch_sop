import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_checkin_link.freezed.dart';

@freezed
class CheckinLink with _$CheckinLink {
  const CheckinLink._();

  const factory CheckinLink({
    String? lastName,
    String? reservationConfirmationNumber,
    String? adobeDeepLinkParameter,
  }) = _CheckinLink;

  String toUri() {
    return Uri(
      path: '/check_in',
      queryParameters: {
        if (lastName?.isNotEmpty == true) 'lastName': lastName,
        if (reservationConfirmationNumber?.isNotEmpty == true)
          'confirmationNumber': reservationConfirmationNumber,
      },
    ).toString();
  }
}
