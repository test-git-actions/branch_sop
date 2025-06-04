part of 'create_deep_link_cubit.dart';

@freezed
class CreateDeepLinkState with _$CreateDeepLinkState {
  const factory CreateDeepLinkState.formData({
    required ProductType productType,
    required Link link,
    String? generatedLink,
    @Default(false) bool isLoading,
    String? apiErrorMessage,
  }) = _CreateDeepLinkState;
}
