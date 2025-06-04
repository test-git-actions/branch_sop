part of 'analytics_keys_cubit.dart';

@freezed
class AnalyticsKeysState with _$AnalyticsKeysState {
  const factory AnalyticsKeysState.data({
    AnalyticsKeys? analyticsKeys,
    String? adobeDeepLinkParameter,
  }) = _Initial;
}
