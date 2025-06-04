part of 'create_page_deep_link_cubit.dart';

@freezed
class CreatePageDeepLinkState with _$CreatePageDeepLinkState {
  const factory CreatePageDeepLinkState.formData({
    required Link link,
    String? generatedLink,
    @Default(false) bool isLoading,
    String? apiErrorMessage,
  }) = _CreatePageDeepLinkState;
}
