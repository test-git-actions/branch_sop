part of 'nightlife_cubit.dart';

@freezed
class NightlifeState with _$NightlifeState {
  const factory NightlifeState.formData({
    DateTime? startDate,
    String? deepLinkURL,
    String? errorMessage,
    OGMetadata? metadata,
    @Default({}) Set<Filter> selectedNightlifeCategoriesFilters,
    @Default({}) Set<Property> selectedProperties,
    @Default(false) bool isLoading,
  }) = _FormData;
}
