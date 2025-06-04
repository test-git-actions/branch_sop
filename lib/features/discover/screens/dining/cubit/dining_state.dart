part of 'dining_cubit.dart';

@freezed
class DiningState with _$DiningState {
  const factory DiningState.formData({
    DateTime? startDate,
    String? deepLinkURL,
    String? errorMessage,
    OGMetadata? metadata,
    @Default({}) Set<Filter> selectedMealTypeFilters,
    @Default({}) Set<Filter> selectedCuisineFilters,
    @Default({}) Set<Filter> selectedPriceFilters,
    @Default({}) Set<Property> selectedProperties,
    @Default({}) Set<Filter> selectedOptionFilters,
    @Default(false) bool isLoading,
  }) = _FormData;
}
