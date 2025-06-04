part of 'entertainment_cubit.dart';

@freezed
class EntertainmentState with _$EntertainmentState {
  const factory EntertainmentState.formData({
    DateTime? startDate,
    DateTime? endDate,
    String? deepLinkURL,
    String? errorMessage,
    OGMetadata? metadata,
    @Default({}) Set<Filter> selectedCategoriesFilters,
    @Default({}) Set<Property> selectedProperties,
    @Default(false) bool isLoading,
  }) = _FormData;
}
