import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/features/analytics_keys/data/models/analytics_keys.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tAnalyticsKeys = AnalyticsKeys(
    platformOrigin: 'platformOrigin',
    campaign: 'campaign',
    utmMedium: 'utmMedium',
    creativeName: 'creativeName',
    keyword: 'keyword',
    site: 'site',
  );

  group(
    'Set value fields',
    () {
      blocTest(
        'should emit [AnalyticsKeysState.data with the passed platform origin',
        build: () => AnalyticsKeysCubit(),
        act: (cubit) =>
            cubit.updatePlatformOrigin(tAnalyticsKeys.platformOrigin),
        expect: () => [
          const AnalyticsKeysState.data(
            analyticsKeys: AnalyticsKeys(platformOrigin: 'platformOrigin'),
          ),
        ],
      );

      blocTest(
        'should emit [AnalyticsKeysState.data with the passed campaign',
        build: () => AnalyticsKeysCubit(),
        act: (cubit) => cubit.updateCampaign(tAnalyticsKeys.campaign),
        expect: () => [
          const AnalyticsKeysState.data(
            analyticsKeys: AnalyticsKeys(campaign: 'campaign'),
          ),
        ],
      );

      blocTest(
        'should emit [AnalyticsKeysState.data with the passed utmMedium',
        build: () => AnalyticsKeysCubit(),
        act: (cubit) => cubit.updateUtmMedium(tAnalyticsKeys.utmMedium),
        expect: () => [
          const AnalyticsKeysState.data(
            analyticsKeys: AnalyticsKeys(utmMedium: 'utmMedium'),
          ),
        ],
      );
      blocTest(
        'should emit [AnalyticsKeysState.data with the passed creativeName',
        build: () => AnalyticsKeysCubit(),
        act: (cubit) => cubit.updateCreativeName(tAnalyticsKeys.creativeName),
        expect: () => [
          const AnalyticsKeysState.data(
            analyticsKeys: AnalyticsKeys(creativeName: 'creativeName'),
          ),
        ],
      );
      blocTest(
        'should emit [AnalyticsKeysState.data with the passed keyword',
        build: () => AnalyticsKeysCubit(),
        act: (cubit) => cubit.updateKeyword(tAnalyticsKeys.keyword),
        expect: () => [
          const AnalyticsKeysState.data(
            analyticsKeys: AnalyticsKeys(keyword: 'keyword'),
          ),
        ],
      );

      blocTest(
        'should emit [AnalyticsKeysState.data with the passed site',
        build: () => AnalyticsKeysCubit(),
        act: (cubit) => cubit.updateSite(tAnalyticsKeys.site),
        expect: () => [
          const AnalyticsKeysState.data(
            analyticsKeys: AnalyticsKeys(site: 'site'),
          ),
        ],
      );

      blocTest(
        'should emit [AnalyticsKeysState.data with the passed adobeDeepLinkID',
        build: () => AnalyticsKeysCubit(),
        act: (cubit) => cubit.updateAdobeDeepLinkParameter('adobeDeepLinkID'),
        expect: () => [
          const AnalyticsKeysState.data(
            adobeDeepLinkParameter: 'adobeDeepLinkID',
          ),
        ],
      );
    },
  );
}
