part of 'properties_cubit.dart';

@freezed
sealed class PropertiesState with _$PropertiesState {
  const factory PropertiesState.loading() = PropertiesLoading;
  const factory PropertiesState.loaded(List<Property> properties) =
      PropertiesLoaded;
  const factory PropertiesState.error() = PropertiesError;
}
