part of 'create_checkin_link_cubit.dart';

@freezed
class CreateCheckinLinkState with _$CreateCheckinLinkState {
  const factory CreateCheckinLinkState({
    @Default(CheckinLink()) CheckinLink deepLink,
    @Default(false) bool isLoading,
    String? generatedDeepLink,
    String? apiErrorMessage,
  }) = _FormLoaded;
}
