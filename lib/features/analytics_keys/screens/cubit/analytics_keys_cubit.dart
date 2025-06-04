import 'package:branch_links/core/extensions/cubit_extension.dart';
import 'package:branch_links/features/analytics_keys/data/models/analytics_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_keys_state.dart';
part 'analytics_keys_cubit.freezed.dart';

class AnalyticsKeysCubit extends Cubit<AnalyticsKeysState> {
  AnalyticsKeysCubit() : super(const AnalyticsKeysState.data());

  void updatePlatformOrigin(String? platformOrigin) {
    safeEmit(
      state.copyWith(
        analyticsKeys: state.analyticsKeys?.copyWith(
              platformOrigin: platformOrigin,
            ) ??
            AnalyticsKeys(platformOrigin: platformOrigin),
      ),
    );
  }

  void updateCampaign(String? campaign) {
    safeEmit(
      state.copyWith(
        analyticsKeys: state.analyticsKeys?.copyWith(
              campaign: campaign,
            ) ??
            AnalyticsKeys(campaign: campaign),
      ),
    );
  }

  void updateUtmMedium(String? utmMedium) {
    safeEmit(
      state.copyWith(
        analyticsKeys: state.analyticsKeys?.copyWith(
              utmMedium: utmMedium,
            ) ??
            AnalyticsKeys(utmMedium: utmMedium),
      ),
    );
  }

  void updateCreativeName(String? creativeName) {
    safeEmit(
      state.copyWith(
        analyticsKeys: state.analyticsKeys?.copyWith(
              creativeName: creativeName,
            ) ??
            AnalyticsKeys(creativeName: creativeName),
      ),
    );
  }

  void updateKeyword(String? keyword) {
    safeEmit(
      state.copyWith(
        analyticsKeys: state.analyticsKeys?.copyWith(
              keyword: keyword,
            ) ??
            AnalyticsKeys(keyword: keyword),
      ),
    );
  }

  void updateSite(String? site) {
    safeEmit(
      state.copyWith(
        analyticsKeys: state.analyticsKeys?.copyWith(
              site: site,
            ) ??
            AnalyticsKeys(site: site),
      ),
    );
  }

  void updateAdobeDeepLinkParameter(String? updatedAdobeDeepLinkParameter) {
    safeEmit(
      state.copyWith(
        adobeDeepLinkParameter: updatedAdobeDeepLinkParameter,
      ),
    );
  }
}
