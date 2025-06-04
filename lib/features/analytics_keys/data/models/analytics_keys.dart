import 'package:equatable/equatable.dart';

class AnalyticsKeys extends Equatable {
  final String? platformOrigin;
  final String? campaign;
  final String? utmMedium;
  final String? creativeName;
  final String? keyword;
  final String? site;

  const AnalyticsKeys({
    this.platformOrigin,
    this.campaign,
    this.utmMedium,
    this.creativeName,
    this.keyword,
    this.site,
  });

  AnalyticsKeys copyWith({
    String? platformOrigin,
    String? campaign,
    String? utmMedium,
    String? creativeName,
    String? keyword,
    String? site,
  }) {
    return AnalyticsKeys(
      platformOrigin: platformOrigin ?? this.platformOrigin,
      campaign: campaign ?? this.campaign,
      utmMedium: utmMedium ?? this.utmMedium,
      creativeName: creativeName ?? this.creativeName,
      keyword: keyword ?? this.keyword,
      site: site ?? this.site,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '~channel': platformOrigin,
      '~campaign': campaign,
      '~feature': utmMedium,
      '~creativeName': creativeName,
      '~keyword': keyword,
      '~sub_site_name': site,
    };
  }

  @override
  List<Object?> get props => [
        platformOrigin,
        campaign,
        utmMedium,
        creativeName,
        keyword,
        site,
      ];
}
