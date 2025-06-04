class Constants {
  /// Error message keys
  static const unknownErrorKey = 'unknownError';
  static const connectionTimeoutKey = 'timeout';
  static const receiveTimeoutKey = 'receiveTimeout';

  static const devBranchKey = 'key_test_bEch4g5pgmVmH3X4dkdHCojjzEiZmuyy';
  static const prodBranchKey = 'key_live_mrcjYlXbbjOfS40XdifVkllmAzp1pBqj';
  static const branchAppID = '1210352016325366549';

  // Discover constants
  static const sop = 'SOP';
  static const discover = 'Discover link';
  static const dining = 'Dining';
  static const entertainment = 'Entertainment';
  static const nightlife = 'Nightlife';

  // Page path constants
  static const discoverPath = 'discover';

  // Analytics keys
  static const adobeDeepLinkParameter = 'a.deeplink.id';
  static const platformOriginLabel = 'Platform Origin';
  static const campaignLabel = 'Campaign';
  static const utmMediumLabel = 'UTM Medium';
  static const creativeNameLabel = 'Creative Name';
  static const keywordLabel = 'Keyword';
  static const siteLabel = 'Site';
  static const adobeDeepLinkLabel = 'Adobe Parameter';
}

// PDP constants
enum ProductType {
  club('club'),
  show('show'),
  restaurant('restaurant');

  const ProductType(this.value);

  final String value;

  static ProductType? fromString(String productTypeString) {
    try {
      return ProductType.values.firstWhere(
        (element) => element.value == productTypeString,
      );
    } catch (e) {
      return null;
    }
  }
}
